# -*- mode: python ; coding: utf-8 -*-
"""Known-good PyInstaller spec: pywebview + Python http.server + onnxruntime/RapidOCR.

Usage: python -m PyInstaller app.spec --noconfirm
Builds a one-folder (onedir) green build under dist/<App>/; zip that folder for distribution.
"""

from PyInstaller.utils.hooks import collect_data_files, collect_submodules

# 1) Static frontend files the HTTP server serves — ADD ANY NEW FILE HERE.
#    New .js/.html/.css added to the project MUST be listed or the packaged
#    app silently 404s them (verified: charts.js / frontend-utils.js were the
#    silent breakage in a real session).
datas = [
    ("index.html", "."),
    ("app.js", "."),
    ("styles.css", "."),
    # ("charts.js", "."),          # <- add new static files
    # ("frontend-utils.js", "."),
    # ("使用说明.md", "."),         # <- user-facing docs ride along
]

# 2) OCR models — WITHOUT these the packaged app loads but OCR fails at runtime.
#    collect_data_files copies the package's non-.py files (the .onnx models).
datas += collect_data_files("rapidocr_onnxruntime")
datas += collect_data_files("onnxruntime")

# 3) Hidden imports for onnxruntime/rapidocr (dynamic imports are invisible to PyInstaller).
hiddenimports = []
hiddenimports += collect_submodules("rapidocr_onnxruntime")
hiddenimports += collect_submodules("onnxruntime")
hiddenimports += ["backend", "backend.ai", "backend.amounts", "backend.config",
                  "backend.deepseek", "backend.domain", "backend.ocr",
                  "backend.parser", "backend.rules", "backend.server"]

a = Analysis(
    ["main.py"],
    pathex=[],
    binaries=[],
    datas=datas,
    hiddenimports=hiddenimports,
    hookspath=[],
    runtime_hooks=[],
    # NEVER exclude numpy when onnxruntime is present — it imports numpy at runtime.
    excludes=["tkinter", "matplotlib", "pandas"],
    noarchive=False,
)

pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name="AppName",          # <- window title / exe name
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,
    console=False,           # <- windowed app: no console window
    disable_windowed_traceback=False,
    icon=None,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=False,
    name="AppName",
)
