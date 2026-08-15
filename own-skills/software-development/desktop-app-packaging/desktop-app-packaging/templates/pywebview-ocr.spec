# -*- mode: python ; coding: utf-8 -*-
"""PyInstaller spec: pywebview + RapidOCR 桌面应用 → 绿色版文件夹（zip 分发）。

用法: python -m PyInstaller app.spec --noconfirm
产物: dist/<AppName>/ 文件夹（exe + _internal/，可整文件夹 zip 分发）。
实战来源: 公司记账项目（公司记账.exe），已验证可运行。
"""

from PyInstaller.utils.hooks import collect_data_files, collect_submodules

# 前端静态文件（pywebview 加载本地 HTTP 服务时 serve 的文件）
datas = [
    ("index.html", "."),
    ("app.js", "."),
    ("styles.css", "."),
]
# 关键：onnx 模型不会自动收集，必须 collect_data_files
datas += collect_data_files("rapidocr_onnxruntime")
datas += collect_data_files("onnxruntime")

hiddenimports = []
hiddenimports += collect_submodules("rapidocr_onnxruntime")
hiddenimports += collect_submodules("onnxruntime")
# 显式列出应用自己的所有模块（PyInstaller 静态分析经常漏 backend 包）
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
    # 千万不要排除 numpy —— onnxruntime 硬依赖，排除后 OCR 运行时报错
    excludes=["tkinter", "matplotlib", "pandas"],
    noarchive=False,
)

pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name="公司记账",            # ← 改成你的应用名
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,
    console=False,              # 窗口应用无控制台；排障时可临时改 True 看 traceback
    disable_windowed_traceback=False,
    icon=None,                  # 可选: icon="app.ico"
)

# COLLECT = 文件夹模式（绿色版 zip 分发首选，启动快、模型保持文件形式）
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=False,
    name="公司记账",
)
