set curr_path=%~dp0
call create_envi.bat
cd %curr_path%..\chromium_git\chromium\src
ninja -C out\Debug_GN_x64 cef
cd %curr_path%
pause
