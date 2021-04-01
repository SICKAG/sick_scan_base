set vcpkg=-DCMAKE_TOOLCHAIN_FILE=%USERPROFILE%/documents/development/vcpkg/scripts/buildsystems/vcpkg.cmake
cd 
set msvc=-DMSVC=TRUE
REM set Version=-T v141
md build
cd build
REM set triplet=-DVCPKG_TARGET_TRIPLET=x86-windows-static
set triplet=-DVCPKG_TARGET_TRIPLET=x86-windows
REM https://stackoverflow.com/questions/28350214/how-to-build-x86-and-or-x64-on-windows-from-command-line-with-cmake
cmake.exe %vcpkg% %msvc% %triplet% -G "Visual Studio 16 2019" -A Win32 .. 
cd ..
REM md x64
REM cd x64
REM set triplet=-DVCPKG_TARGET_TRIPLET=x64-windows-static
REM cmake.exe %vcpkg% %msvc% %triplet% -G "Visual Studio 15 2017 Win64" %Version% ..
REM cd ..