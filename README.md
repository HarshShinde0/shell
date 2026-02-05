# shell-scripts

handy utilities for windows

## install

```bash
pip install shell-scripts
```

## quick run (no install)

run directly from powershell:

```powershell
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/HarshShinde0/shell/main/shell_scripts/scripts/save-wallpaper.ps1') }"
```

## usage

save windows spotlight wallpapers:

```bash
save-wallpaper
```

creates a `Lockscreen_Backups` folder with all your spotlight images as jpgs

## requirements

- windows
- python 3.7+

## license

Apache 2.0
