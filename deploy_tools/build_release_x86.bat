set curr_path=%~dp0
call create_envi.bat
cd %curr_path%..\chromium_git\chromium\src
ninja -C out\Release_GN_x86 cef
cd %curr_path%
