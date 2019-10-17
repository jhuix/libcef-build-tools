@echo off
set curr_path=%~dp0
call create_envi.bat
cd ..\chromium_git\chromium\src\cef\tools
set CEF_VCVARS=D:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars32.bat
python.bat make_distrib.py --output-dir %~dp0binary_distrib\ --x64-build --ninja-build
cd %curr_path%
