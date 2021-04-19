REM 
REM Run a basic sick_generic_caller unittest with test server emulating a basic LMS5xx device
REM 

if exist c:\vcpkg\installed\x64-windows\bin set PATH=c:\vcpkg\installed\x64-windows\bin;%PATH%

REM 
REM Start html view
REM 

pushd ..\..\demo
del /f/q scan.jpg scan.csv
start "ImageViewer" image_viewer.html
@timeout /t 1
popd

REM 
REM Start test server
REM 

start "TestServer" .\run_test_server.cmd
@timeout /t 1

REM 
REM Run sick_generic_caller
REM 

pushd ..\..\build
.\Debug\sick_generic_caller.exe ../launch/sick_lms_5xx.launch hostname:=127.0.0.1 sw_pll_only_publish:=False
popd

@pause
