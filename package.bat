chcp 65001
pyinstaller --windowed main.py --name "Application" --add-data "./vue/dist;static/" --icon "./vue/dist/toolbox.ico" --noconfirm
pause