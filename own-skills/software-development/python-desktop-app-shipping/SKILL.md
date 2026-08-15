---
name: python-desktop-app-shipping
description: "Package desktop apps as green-zips. Use when shipping."
version: 1.0.0
author: Hermes Agent (curator)
license: MIT
platforms: [windows, linux, macos]
metadata:
  hermes:
    tags: [pyinstaller, pywebview, packaging, desktop-app, verification, green-zip, productization]
    related_skills: [requesting-code-review, verification-before-completion]
---

# Python Desktop App Shipping

Turn a dev-mode Python app (pywebview + local HTTP server + OCR/AI features) into a shippable green-zip product: PyInstaller packaging, verification of agent-produced code, and dual-mode AI key productization.

## When to Use

- User asks to "打包" / "make it an app" / "供所有人使用" / distribute a Python desktop app
- Agent (Codex or subagent) produced code that must be verified before shipping
- Adding AI features where end users won't have your API key (dual-mode design)

## Green-Zip Packaging (PyInstaller)

1. **Spec essentials** (`templates/pywebview-greenzip.spec`):
   - `datas` must include ALL static frontend files the server serves: `index.html`, `app.js`, `styles.css`, plus any new files (charts.js, utils, docs) — **check this after every code change**; new static files are the #1 silent breakage
   - OCR models: `collect_data_files("rapidocr_onnxruntime")` + `collect_data_files("onnxruntime")` — without this, OCR silently fails at runtime
   - `collect_submodules` for onnxruntime/rapidocr (hidden imports)
   - **Never exclude numpy** when onnxruntime is present — it depends on it (excludes=tkinter/matplotlib/pandas only)
   - `console=False` for the windowed exe
2. **Build**: `python -m PyInstaller app.spec --noconfirm` (background, 1-3 min)
3. **Bundle**: copy 使用说明/README into `dist/<App>/`, then `Compress-Archive` the folder → green zip
4. **RE-verify the exe, not the source**: run `dist/<App>/<App>.exe --no-window --port N`, then hit `/api/health` + static files + one real endpoint. Source-mode tests passing does NOT prove the packaged exe works (models, datas, runtime paths all differ).

## Verification of Agent-Produced Code

Agent self-reports are not evidence. Before accepting:

1. Run the full test suite (pytest + any node frontend tests)
2. **Verify claimed artifacts exist**: Codex claimed "downloaded echarts" but had written a self-contained canvas lib instead — check files, `node --check` JS, curl the static routes
3. **Endpoint-level tests via Python `urllib`/`requests`, never curl from git-bash** — git-bash mangles Chinese in JSON bodies, producing false 404/errors that look like app bugs
4. Check HTTP methods match the frontend's actual calls (e.g. DELETE for attachments, not POST)
5. Check `.env.local`/secrets never enter the repo or dist (`git ls-files | grep env.local`)

## Dual-Mode AI Key Productization

End users won't have your API key. Design:

- **No key = base app works** (recording, OCR, export — everything local)
- **Key in App settings = AI features unlock** (parse, classify, summarize)
- User config in `%APPDATA%/<App>/config.json` (writable in packaged form), priority: user config > `.env.local` (dev only) > env vars
- **Empty key must mean "explicitly off"** — save user config with `api_key=""` semantics (a plain `if api_key:` check leaves the old key, user thinks AI is off but it isn't)
- Never ship `.env.local` in the dist — keep it dev-only via .gitignore; the packaged build must not contain your real key

## Pitfalls

- **Non-ASCII (Chinese) filenames in HTTP headers crash Python http.server**: `Content-Disposition: filename="发票.pdf"` → `UnicodeEncodeError: latin-1 codec` → connection closed. Fix: RFC 5987 — try ascii encode, on failure use `filename*=UTF-8''<percent-encoded>`. See `references/http-server-gotchas.md`.
- **LLM client with a JSON-array-forcing system prompt breaks free-text calls**: if `parse()` hard-codes "only return JSON array", calling it for summaries/descriptions returns `[]`. Split into `parse()` (structured) and `complete_text()` (free text, no JSON system prompt).
- **Closing the orchestrator app kills background agents** — warn the user or use a gateway/daemon for long tasks.
- **API key extraction**: `grep -oE "sk-[a-zA-Z0-9]+"` truncates at `-` inside the key (35 chars → 7) → 401 → agent stuck in retry loop burning tokens. Use `cut -d= -f2-` on the whole line.
- Windows SmartScreen flags unsigned green exes — document "更多信息 → 仍要运行" in the user guide.

## Support Files

- `templates/pywebview-greenzip.spec` — known-good PyInstaller spec for pywebview + onnxruntime/rapidocr apps
- `references/http-server-gotchas.md` — Python http.server bugs (Chinese headers, RFC 5987, method routing) with fixed code
