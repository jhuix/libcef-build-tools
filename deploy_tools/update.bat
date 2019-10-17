set curr_path=%~dp0
call create_envi.bat
call setproxy.bat
mkdir %curr_path%..\chromium_git
cd %curr_path%..\chromium_git
set NO_AUTH_BOTO_CONFIG=%~dp0boto.cfg
set vs2017_install=%VSINSTALLDIR%
set CEF_USE_GN=1
set GN_DEFINES=is_official_build=true ffmpeg_branding=Chrome proprietary_codecs=true use_jumbo_build=true
set GN_ARGUMENTS=--ide=vs2017 --sln=cef --filters=//cef/*
rem python ..\automate\automate-git.py --download-dir=G:\FireFly\libcef\chromium_git --depot-tools-dir=G:\FireFly\libcef\depot_tools --no-distrib --no-build --no-update
python %curr_path%..\automate\automate-git.py --download-dir=%curr_path%..\chromium_git --depot-tools-dir=%curr_path%..\depot_tools --branch=3325 --no-build --no-distrib
rem python %curr_path%..\automate\automate-git.py --download-dir=%curr_path%..\chromium_git --depot-tools-dir=%curr_path%..\depot_tools --branch=3325 --no-build --no-distrib --force-clean
cd %curr_path%
