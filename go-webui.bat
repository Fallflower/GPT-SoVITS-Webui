@echo off
REM 改为你自己的conda路径以及环境名称
call D:\ProgramData\miniconda3\Scripts\activate.bat gswebui

set temp_file=cuda_check.txt

python -c "import torch;print(torch.cuda.is_available())" > %temp_file%

set /p cuda_available=<%temp_file%

del %temp_file%

if "%cuda_available%"=="True" (
    echo CUDA is available.
    REM 在此处添加CUDA可用时要执行的命令
) else (
    echo CUDA is not available.
    REM 在此处添加CUDA不可用时要执行的命令
    pip install -r .\requirements.txt
    pip install torch torchaudio --index-url https://download.pytorch.org/whl/cu121 
)


python.exe webui.py
pause
exit /b