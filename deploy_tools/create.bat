set curr_path=%~dp0
call create_envi.bat
call setproxy.bat
cd %curr_path%..\chromium_git\chromium\src\cef
set vs2017_install=%VSINSTALLDIR%
set GYP_MSVS_VERSION=2017
set CEF_USE_GN=1
set GN_DEFINES=is_official_build=true ffmpeg_branding=Chrome proprietary_codecs=true use_jumbo_build=true
set GN_ARGUMENTS=--ide=vs2017 --sln=cef --filters=//cef/*
call cef_create_projects.bat
cd %curr_path%
