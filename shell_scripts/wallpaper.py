import subprocess
import sys
from pathlib import Path

def save_wallpaper():
    ps1 = Path(__file__).parent / "scripts" / "save-wallpaper.ps1"
    result = subprocess.run(["powershell.exe", "-ExecutionPolicy", "Bypass", "-File", str(ps1)])
    sys.exit(result.returncode)

if __name__ == "__main__":
    save_wallpaper()
