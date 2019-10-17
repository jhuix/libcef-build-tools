# libcef build tools

A build tools for libcef-for-MFC repository in windows.


## Build Step

### Update depot tools

    cd depot_tools
    update_depot_tools.bat

### Get Or Update cef and chromium src

    cd deploy_tools
    update.bat

### Create libcef project files for build

    cd deploy_tools
    create.bat

### Build libcef

For X86

    cd deploy_tools
    build_debug_x86.bat
    build_release_x86.bat

For X86_64

    cd deploy_tools
    build_debug_x86-64.bat
    build_release_x86-64.bat

### Deploy libcef

For X86

    cd deploy_tools
    make_distrib_x86.bat

For X86-64

    cd deploy_tools
    make_distrib_x86-64.bat

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2019-present, [Jhuix](mailto:jhuix0117@gmail.com) (Hui Jin)
