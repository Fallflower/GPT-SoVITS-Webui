@echo off
call D:\ProgramData\miniconda3\Scripts\activate.bat gswebui

python.exe webui.py
pause
exit /b