REM
REM Build sick_scan_base with cmake and Visual Studio 16 Win64 (Visual Studio 2019)
REM

pushd ..\..

set _os=x64
set _cmake_string=Visual Studio 16 2019
set _msvc=Visual Studio 2019
set _cmake_build_dir=build

REM Boost with prebuild binaries:
REM if exist \boost_1_73_0 (
REM   set Boost_DIR=\boost_1_73_0
REM   set Boost_ROOT=\boost_1_73_0
REM   set Boost_INCLUDE_DIR=\boost_1_73_0
REM   set Boost_LIBRARY_DIR=\boost_1_73_0\lib64-msvc-14.2
REM )
REM @echo Boost_DIR=%Boost_DIR%
REM @echo Boost_INCLUDE_DIR=%Boost_INCLUDE_DIR%
REM @echo Boost_LIBRARY_DIR=%Boost_LIBRARY_DIR%

REM Boost support by vcpkg (recommended):
REM 1. Install vcpkg:
REM    Download vcpkg-master.zip from https://github.com/microsoft/vcpkg/archive/master.zip and unzip to c:/vcpkg. Alternatively, run "git clone https://github.com/microsoft/vcpkg"
REM    Install by running the following commands:
REM    cd c:/vcpkg
REM    .\bootstrap-vcpkg.bat
REM    .\vcpkg integrate install
REM 2. Install required packages:
REM    vcpkg.exe install pthread:x86-windows
REM    vcpkg.exe install pthread:x64-windows
REM    vcpkg.exe install boost:x64-windows
REM 3. Include vcpkg in your path:
REM    set PATH=c:\vcpkg\installed\x64-windows\bin;%PATH%

if exist c:\vcpkg\installed\x64-windows\bin set PATH=c:\vcpkg\installed\x64-windows\bin;%PATH%
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe" set VS_DEVENV="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe"

if not exist %_cmake_build_dir% mkdir %_cmake_build_dir%
pushd %_cmake_build_dir%
cmake -G "%_cmake_string%" ..
if %ERRORLEVEL% neq 0 ( @echo ERROR building %_cmake_string% project with cmake & @pause )
start "sick_scan_base" %VS_DEVENV% sick_scan_base.sln
popd

popd
@timeout /t 10
