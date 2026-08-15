# Python http.server Gotchas (verified in real sessions)

Bugs hit while building a pywebview + `http.server` desktop app. All were
real, reproducible, and initially looked like "app is broken" when the fault
was in the server layer.

## 1. Non-ASCII filenames in Content-Disposition crash the connection

**Symptom:** `POST /api/attachment` (upload) works, but `GET /api/attachment?id=...`
closes the connection with no response body. Server log shows:

```
UnicodeEncodeError: 'latin-1' codec can't encode characters in position 76-77
```

**Cause:** `send_header("Content-Disposition", f'inline; filename="{stored_name}"')`
with a Chinese filename (e.g. `发票.pdf`). http.server encodes headers as
latin-1; any non-ASCII byte raises and the handler dies before writing the body.

**Fix — RFC 5987 filename\* (percent-encoded UTF-8):**

```python
body, stored_name = result
self.send_response(200)
self.send_header("Content-Type", content_type_for(stored_name))
try:
    stored_name.encode("ascii")
    disposition = f'inline; filename="{stored_name}"'
except UnicodeEncodeError:
    from urllib.parse import quote
    disposition = f"inline; filename*=UTF-8''{quote(stored_name)}"
self.send_header("Content-Disposition", disposition)
self.send_header("Content-Length", str(len(body)))
self.end_headers()
self.wfile.write(body)
```

**Lesson for testing:** the crash only appears when the uploaded filename
contains Chinese. Test attachment flows with a Chinese filename, not just
`test.pdf` — ASCII-only tests pass while real users fail.

## 2. Chinese in request JSON gets mangled by git-bash curl

**Symptom:** endpoint works when called from the web frontend, but `curl -d '{"text":"打车费 45"}'`
returns garbage / wrong route / wrong results. You suspect the app; the app is fine.

**Cause:** git-bash (MSYS) mangles non-ASCII in curl command lines / bodies.

**Fix:** test endpoints from Python, never curl-with-Chinese:
```python
req = urllib.request.Request(url,
    data=json.dumps(payload, ensure_ascii=False).encode("utf-8"),
    headers={"Content-Type": "application/json; charset=utf-8"})
resp = json.load(urllib.request.urlopen(req))
```

## 3. Method routing — the frontend's real HTTP method wins

**Symptom:** hand-written test does `POST /api/attachment/delete` → 404, and you
"fix" the server. But the frontend actually calls `DELETE /api/attachment?id=...`.

**Lesson:** read the frontend's fetch calls (`grep -n 'fetch(' app.js`) to learn
the real methods before adding/removing routes. Test with the SAME method the
frontend uses. In this session the DELETE route existed and worked; only the
test script used the wrong method.

## 4. Static file routing must be extended for every new frontend file

`STATIC_FILES = {"/": "index.html", ...}` is a fixed dict — new files
(`charts.js`, `frontend-utils.js`) return 404 until added. After any frontend
change, check:
1. `STATIC_FILES` in server.py includes the new file
2. the `<script src>` tag in index.html points at it
3. the PyInstaller spec `datas` includes it (packaged app 404s otherwise)
