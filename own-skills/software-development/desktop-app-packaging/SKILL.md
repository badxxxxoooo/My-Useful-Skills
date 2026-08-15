---
name: desktop-app-packaging
description: "Use when 打包/分发 Python 桌面应用为绿色 exe（PyInstaller）。"
version: 1.0.0
author: Hermes Agent (from company-ledger packaging session)
license: MIT
platforms: [windows, linux, macos]
metadata:
  hermes:
    tags: [packaging, pyinstaller, desktop-app, pywebview, ocr, distribution, green-version]
    related_skills: [task-router, requesting-code-review, verification-before-completion]
---

# Desktop App Packaging

Package a Python desktop app (pywebview / PySide / Tkinter + local HTTP backend) into a **distributable green-version folder** (zip-able, no installer, no Python needed on target machine). Covers the full path: spec file → model/data collection → dual-mode config → verification → zip.

## When to Use

- User says "打包成 app / 绿色版 / 发给别人用 / 做成独立软件"
- App currently runs via `python main.py` and needs to become double-click-runnable
- Target users won't have Python, pip, or the app's model files

## Key Decisions First (ask user before building)

1. **Key strategy** — if the app calls a paid API, never hardcode the developer's key into the build. Offer dual-mode: no key = core features work (local rules/OCR), user fills their own key in an in-app settings dialog to unlock AI. Store user config in `%APPDATA%/<AppName>/config.json` (writable in packaged mode).
2. **Distribution form** — green folder zipped (simplest, zip-able) vs installer (Inno Setup/NSIS, needs extra tooling). Most home/company users: green zip is fine.
3. **Keep dev-only secrets OUT** — `.env.local` with the developer's key must never be listed in spec `datas`. Verify after build: `grep -rl "sk-" dist/` returns nothing.

## PyInstaller Spec Essentials (pywebview + OCR)

See `templates/pywebview-ocr.spec` for a complete working example. Key points:

- **Frontend files as datas**: `datas = [("index.html","."), ("app.js","."), ("styles.css",".")]` — they land in `_internal/` alongside the exe.
- **Model-bearing deps need `collect_data_files`**: `onnxruntime` and `rapidocr_onnxruntime` ship `.onnx` models that PyInstaller will NOT pick up automatically. Use `collect_data_files("rapidocr_onnxruntime")` + `collect_data_files("onnxruntime")`.
- **Hidden imports**: `collect_submodules("rapidocr_onnxruntime")` + `collect_submodules("onnxruntime")` + every `backend.*` module explicitly.
- **excludes**: `tkinter`, `matplotlib`, `pandas` — but NEVER `numpy` (onnxruntime hard-depends on it; excluding breaks OCR at runtime).
- **Folder mode (COLLECT) not onefile** for zip distribution — faster startup, easier to debug, models stay as files.
- `console=False` for a windowed app (no console flash). For headless testing of the packaged exe, support a `--no-window` flag in main.py and run the exe with it.
- **Icon**: `icon=None` is fine initially; custom .ico optional.

## PROJECT_ROOT Gotcha (packaged path resolution)

`Path(__file__).resolve().parent.parent` from `backend/config.py` resolves to `_internal/` in the build — which is where frontend files land, so it works. But verify with a real run; don't assume. If static files are served by an HTTP server, confirm `GET /index.html` returns 200 from the packaged exe.

## Dual-Mode Config Pattern (API key optional)

```python
# config.py — user config wins; empty string = explicitly OFF (overrides env/.env fallback)
def get_deepseek_config():
    user_cfg = _load_user_config()          # %APPDATA%/<App>/config.json
    if "api_key" in user_cfg:               # user explicitly configured (even empty = off)
        return {"api_key": user_cfg.get("api_key","").strip(), ...}
    return env_fallback()                   # .env.local / env vars (dev only)
```

- `save_user_config()` must write empty strings too (a cleared key field = turn AI off), not skip them — `if api_key:` skips clearing, a classic bug.
- Hot-reload the client's key after save (mutate `client.api_key`) so no restart needed.
- In-app settings dialog (HTML `<dialog>`) + `/api/config` GET + `/api/config/save` POST endpoints.

## Verification Gate (MANDATORY before shipping)

1. `pytest` all green in dev venv.
2. Build: `python -m PyInstaller app.spec --noconfirm` (background, ~1-3 min; wait for exit).
3. **Packaged exe smoke test** (not the dev venv!):
   - Start packaged exe with `--no-window --port N`, then `GET /api/health` → 200.
   - Generate a synthetic image (PIL, Chinese text via `C:/Windows/Fonts/msyh.ttc`) → POST to OCR endpoint → assert recognized text + parsed records non-empty. This proves the `.onnx` models were bundled.
   - Window mode: start exe without `--no-window`, check `msedgewebview2.exe` process count increases.
4. **No secret leakage**: `grep -rl "sk-" dist/` empty.
5. Zip the folder; test unzip → double-click exe → window opens.
6. Test Chinese JSON via Python `urllib`/`requests`, NOT curl from git-bash (mangles CJK — false bugs).
7. **Test with non-ASCII filenames end-to-end** — unit tests can pass while real HTTP flows break. Real incident: attachment upload with a Chinese filename (`增值税发票.pdf`) made the packaged server's GET handler crash (`UnicodeEncodeError: 'latin-1' codec can't encode` → RemoteDisconnected, connection closed) even though all 51 pytest tests were green. Fix: RFC 5987 filename encoding (see Pitfalls).

## Pitfalls

- **Chinese filenames in HTTP headers kill `http.server`** — `send_header("Content-Disposition", f'inline; filename="{name}"')` throws `UnicodeEncodeError: 'latin-1' codec` when the name has CJK, and the client sees a dropped connection. Fix:
  ```python
  try:
      stored_name.encode("ascii")
      disposition = f'inline; filename="{stored_name}"'
  except UnicodeEncodeError:
      from urllib.parse import quote
      disposition = f"inline; filename*=UTF-8''{quote(stored_name)}"
  self.send_header("Content-Disposition", disposition)
  ```
  Always exercise upload→read→delete with a Chinese filename in the verification gate — the endpoint's happy-path test may use ASCII names and miss this.

- **numpy exclusion kills onnxruntime** — always keep numpy.
- **`console=False` hides tracebacks** — test with `--no-window` headless first; if the exe crashes silently, temporarily build with `console=True` to see the error.
- **SmartScreen "已保护你的电脑"** — unsigned green exe triggers it; document "更多信息 → 仍要运行" in the user guide. Normal, not a virus.
- **Don't delete dev `.env.local`** — the build never bundles it anyway (only `datas` listed files go in); keep it for development.
- **`_internal/` layout** — frontend + models all under `_internal/`; paths that worked in dev (`../index.html`) may break; test static file serving from the packaged exe.
- **`taskkill /F /IM msedgewebview2.exe` kills ALL WebView2 processes system-wide** (other apps too); kill only the app's own process/session.
- **Endpoints added after build** — rebuild after any backend change; stale exe = 404 on new routes.
- **PowerShell `Compress-Archive` can fail on a locked `.pyd`** — a freshly-built folder may have a DLL/.pyd momentarily locked (antivirus scan or a lingering process); `Compress-Archive` aborts the whole zip with "PermissionDenied/UnauthorizedAccessError". Fallback that always works: Python `zipfile` (walk the folder, `zf.write(full, rel)`), which skips-or-continues gracefully and is also fine for CJK paths:
  ```python
  import zipfile, os
  with zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED) as zf:
      for root, dirs, files in os.walk(src):
          for f in files:
              full = os.path.join(root, f)
              zf.write(full, os.path.relpath(full, src))
  ```
  Real incident (2026-08): PowerShell Compress-Archive failed on `_internal\PIL\_avif.cp311-win_amd64.pyd` "正在被另一个进程使用"; Python zipfile completed the same 275-file archive in ~13s.

## Reference

- `templates/pywebview-ocr.spec` — complete PyInstaller spec for a pywebview + RapidOCR app (company-ledger, verified working).
