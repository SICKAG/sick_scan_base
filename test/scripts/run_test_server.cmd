@if exist %ProgramFiles(x86)%/Microsoft Visual Studio/Shared/Python36_64 (
  set PYTHON_DIR=%ProgramFiles(x86)%/Microsoft Visual Studio/Shared/Python36_64
  set PATH=%PYTHON_DIR%;%PYTHON_DIR%/Scripts;%PATH%
)
@if exist %ProgramFiles(x86)%/Microsoft Visual Studio/Shared/Python37_64 (
  set PYTHON_DIR=%ProgramFiles(x86)%/Microsoft Visual Studio/Shared/Python37_64
  set PATH=%PYTHON_DIR%;%PYTHON_DIR%/Scripts;%PATH%
)
@echo.
echo PATH=%PATH%
echo PYTHON_DIR=%PYTHON_DIR%
python --version
@echo.

pushd ..\..\build
python ../test/emulator/test_server.py --scandata_file=../test/emulator/scandata/20210302_lms511.pcapng.scandata.txt --scandata_frequency=20.0 --tcp_port=2112
popd
@pause
