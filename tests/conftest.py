import os
import sys


if sys.platform.startswith("linux") and not os.environ.get("DISPLAY"):
    # Ensure Qt uses an offscreen platform when running headless Linux tests.
    os.environ.setdefault("QT_QPA_PLATFORM", "offscreen")
