# sick_scan_base
Generic driver for SICK laser scanner

Generic C++ library for SICK laser scanner. Currently we support Windows and Ubuntu 18.04LTS for x86 architectures with this software.  Within the demo the gathered data is stored at regular intervals as CSV data and as an image file in JPEG format. The image file shows the scan data in the top view.

## Remark

During the last years we have developed different repositories within the driver development with the projects sick_scan, sick_scan2 and sick_scan_base, with which many lidars and radars of our company can be used under ROS1, ROS2 and generically under C++. For harmonization, due to customer requests and to increase clarity, we decided to combine these developments in the future. As a result of this work, at the end of 2021 we have created the repository [sick_scan_xd](https://github.com/SICKAG/sick_scan_xd), where we will continue future developments. We recommend using this new repository for development so that you can continue to benefit from our improvements and additions to our drivers.


## Supported Hardware

This driver should work with all of the following products.

| **device name**    |  **part no.**                                                                                                                | **description**                                | **tested?**     |
|--------------------|------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------|:---------------:|
| MRS1104            | [1081208](https://www.sick.com/sg/en/detection-and-ranging-solutions/3d-lidar-sensors/mrs1000/mrs1104c-111011/p/p495044)         | 4 layer max. range: 64 m, ang. resol. 0.25 [deg] hor., 2.50 [deg] ver.                                         | ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 50 Hz, 4x12.5 Hz            |                 |
| TiM433             | prototype  | 1 layer range: 0.05 m ... 15 m, ang. resol. 0.33 [deg], 240 [deg]| ✔ [prototype]|
|                    |                                                                                                                                  | Scan-Rate: 15.0 Hz   |                 |
| TiM443             | prototype  | 1 layer range: 0.05 m ... 15 m, ang. resol. 0.33 [deg], 240 [deg]| ✔ [prototype]|
|                    |                                                                                                                                  | Scan-Rate: 15.0 Hz   |                 |
| TiM551             | [1060445](https://www.sick.com/de/en/detection-and-ranging-solutions/2d-lidar-sensors/tim5xx/tim551-2050001/p/p343045)                 | 1 layer max. range: 10 m, ang. resol. 1.00[deg] | ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 15 Hz   |                 |
| TiM561             | [1071419](https://www.sick.com/de/en/detection-and-ranging-solutions/2d-lidar-sensors/tim5xx/tim561-2050101/p/p369446)                 | 1 layer max. range: 10 m, ang. resol. 0.33 [deg]| ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 15 Hz   |                 |
| TiM571             | [1079742](https://www.sick.com/de/en/detection-and-ranging-solutions/2d-lidar-sensors/tim5xx/tim571-2050101/p/p412444)                 | 1 layer max. range: 25 m, ang. resol. 0.33 [deg]| ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 15 Hz   |                 |
| TiM781             | [1096807](https://www.sick.com/de/de/mess-und-detektionsloesungen/2d-lidar-sensoren/tim7xx/tim781-2174101/p/p594148)                 | 1 layer max. range: 25 m, ang. resol. 0.33 [deg]| ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 15 Hz   |                 |
| TiM781S            | [1096363](https://www.sick.com/de/de/mess-und-detektionsloesungen/2d-lidar-sensoren/tim7xx/tim781s-2174104/p/p594149)                 | 1 layer max. range: 25 m, ang. resol. 0.33 [deg]| ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 15 Hz   |                 |
| LMS511-10100 PRO   | [e.g. 1046135](https://www.sick.com/de/en/detection-and-ranging-solutions/2d-lidar-sensors/lms5xx/c/g179651)     | 1 layer max. range: 80 m, ang. resol. 0.167 [deg]| ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 100 Hz   |                 |
| LMS4xxx-Family      | [e.g. 1091423](https://www.sick.com/de/de/mess-und-detektionsloesungen/2d-lidar-sensoren/lms4000/lms4111r-13000/p/p578044?ff_data) | 1 layer max. range: 3 m, ang. resol. 0,0833 [deg]| ✔ [stable]|
|                    |                                                                                                                                  | Scan-Rate: 600 Hz   |                 |
## Installation

### Windows installation

To install sick_scan_base on Windows, follow the steps below:

1. If not yet done, install Visual Studio. Visual Studio 2019 Community or Professional Edition is recommended.

2. If not yet done, install boost and pthread using Visual Studios package manager vcpkg:
   * Install vcpkg:
      * Download vcpkg-master.zip from https://github.com/microsoft/vcpkg/archive/master.zip and unzip to `c:\vcpkg`. Alternatively, run "git clone https://github.com/microsoft/vcpkg"
      * Install vcpkg by running the following commands:
         ```
        cd c:/vcpkg
        .\bootstrap-vcpkg.bat
        .\vcpkg integrate install
        ```
   * Install required packages:
      ```
     vcpkg.exe install pthread:x86-windows
     vcpkg.exe install pthread:x64-windows
     vcpkg.exe install boost:x64-windows
     ```
   * Include vcpkg in your path:
      ```
     set PATH=c:\vcpkg\installed\x64-windows\bin;%PATH%
     ```

3. Clone repository https://github.com/SICKAG/sick_scan_base:
   ```
   git clone https://github.com/SICKAG/sick_scan_base.git
   ```

4. Build sick_generic_caller with cmake and Visual Studio 2019:
   ```
   cd sick_scan_base
   set _os=x64
   set _cmake_string=Visual Studio 16 2019
   set _msvc=Visual Studio 2019
   set _cmake_build_dir=build
   if not exist %_cmake_build_dir% mkdir %_cmake_build_dir%
   pushd %_cmake_build_dir%
   cmake -G "%_cmake_string%" ..
   popd
   ```
   Open file `build\sick_scan_base.sln` in Visual Studio and build all targets (shortcut F7).

### Ubuntu installation

To install on Ubuntu, follow the steps below:

1. Clone repository https://github.com/SICKAG/sick_scan_base:
   ```console
   git clone https://github.com/SICKAG/sick_scan_base.git
   ```

2. Build sick_generic_caller by using cmake
   ```console
   cd sick_scan_base
   mkdir -p ./build
   cd ./build
   cmake -G "Unix Makefiles" ..
   ```

3. Compile the software and build sick_generic_caller:
   ```console
   make
   ```

## Running

1. Start software e.g. with
```console
sick_generic_caller ./launch/sick_mrs_1xxx.launch hostname:=192.168.0.72
```

In general the software starts with the following options:

```console
sick_generic_caller <launch-file> [<tag1>:=<value1>] [<tag2>:=<value>] ... [<tagn>:=<valuen>]
```

The tag/value pairs overwrite the settings in the launch file.

## Check results
The software starts, connects to the scanner and writes data to the demo directory at regular intervals.
It generates a top view scan image and a csv data file.

The HTML file image_viewer.html can be loaded into your favorite browser for checking purposes. The generated scan image is then shown in the browser.

You can find reference outputs in the demo directory.


## Parameters

For the launch-file settings and the tag/values pairs the following keywords are supported:

| Keyword      |     Meaning     |  Default value |    Hint       |
|--------------|-----------------|----------------|---------------|
| scanner_type |  Scanner family |  ???           | see list above |
| min_ang      |  Start scan angle in [rad] |  -2.3998277           |  |
| max_ang      |  End scan angle in [rad] |  +2.3998277           |  |
| intensity_resolution_16bit | Switch between 8Bit/16Bit| "false" | do not change|
| hostname | Ip address of scanner  | 192.168.0.1 | change to scanner ip address in your network (see faq) |
| port | port number  | 2112 | do not change, check firewall rules if there is blocking traffic  |
| timelimit | Timelimit in [sec]   | 5 | do not change  |

## Supported operating systems

This driver supports the following x86-based operating systems:

* Ubuntu 18.04 with gcc
* Windows 10 with Visual Studio Compiler (VS2017, VS2019)

## Simulation

For unittests without sensor hardware, a LMS511 device can be simulated using the python script `test/emulator/test_server.py`. This script implements a simple tcp server for test purposes. It opens a listening tcp socket, connects to tcp clients, receives cola telegrams and sends predefined responses to the client. 

Please note that this is just a simple test server for basic unittests of sick_scan_base drivers. It does not emulate any real lidar sensors!

### Simulation on Windows

Run script `run_simu_lms_5xx.cmd` in folder `test/scripts` or execute the following commands:

```
REM Start test server
cd .\build
start "testserver" python ../test/emulator/test_server.py --scandata_file=../test/emulator/scandata/20210302_lms511.pcapng.scandata.txt --scandata_frequency=20.0 --tcp_port=2112
@timeout /t 1
REM Run sick_generic_caller
.\Debug\sick_generic_caller.exe ../launch/sick_lms_5xx.launch hostname:=127.0.0.1 sw_pll_only_publish:=False
```

Open file `image_viewer.html` in folder `demo` in your browser to view a jpg-image of the current scan.

Note, that python version 3 incl. runtime dlls must be accessable, f.e. by extending the PATH environment variable:
```
set PYTHON_DIR=%ProgramFiles(x86)%/Microsoft Visual Studio/Shared/Python37_64
set PATH=%PYTHON_DIR%;%PYTHON_DIR%/Scripts;c:\vcpkg\installed\x64-windows\bin;%PATH%
```

### Simulation on Linux

Run script `run_simu_lms_5xx.bash` in folder `test/scripts` or execute the following commands:

```
python3 ./test/emulator/test_server.py --scandata_file=./test/emulator/scandata/20210302_lms511.pcapng.scandata.txt --scandata_frequency=20.0 --tcp_port=2112 &
sleep 1
./build_x64/sick_generic_caller ./launch/sick_lms_5xx.launch hostname:=127.0.0.1 sw_pll_only_publish:=False &
 ```

Open file `image_viewer.html` in folder `demo` in a browser (f.e. firefox) to view a jpg-image of the current scan.

## Keywords

MRS1104
MRS1000
MRS1xxx
sick_scan
SICK LiDAR
SICK Laser
SICK Laserscanner
TiM4xx
TiM433
TiM443
TiM5xx
TiM551
TiM561
TiM571

## Support

* In case of technical support please open a new issue. For optimal support, add the following information to your request:
 1. Scanner model name,
 2. Ros node startup log,
 3. Sopas file of your scanner configuration.
  The instructions at http://sickusablog.com/create-and-download-a-sopas-file/ show how to create the Sopas file.
* In case of application support please use [https://supportportal.sick.com ](https://supportportal.sick.com).
* Issue Handling: Issues, for which no reply was received from the questioner for more than 7 days,						
  are closed by us because we assume that the user has solved the problem.

## Trouble Shooting

The software is very similar to the ROS driver sick_scan. For FAQ and troubleshooting please also have a look at https://github.com/SICKAG/sick_scan

## FAQ

### "ERROR: Tcp::open: Failed to open TCP connection to 192.168.0.1, aborting."

:question: Question:
sick_generic_caller gives you an answer like:
```bash
"ERROR: Tcp::open: Failed to open TCP connection to 192.168.0.1, aborting."
```


:white_check_mark: Answer:
1. Try to ping your device:
   ```bash
   ping 192.168.0.1
   ```
2. Disconnect your scanner and retry ping

   ```bash
   ping 192.168.0.1
   ```  
   The result of ping contains a pattern like
   ```bash
    ... Destination Host Unreachable
   ```
3. Reconnect your device and try to ping:
   ```bash
   ping 192.168.0.1
   ```

If you do not know the ip address, try to find the ip address in your subnet:
```bash
apt-get install fping
```

scan your network (for example, subnet 192.168.10.0/24):
```bash
192.168.0.1/24
```
search for all ip addresses from 192.168.0.0 to 192.168.0.255

The result is similar to:
```bash
192.168.0.4 is alive
192.168.0.22 is alive
```
and a lot of unreachable entries.
In the example the ip address 192.168.0.4 is the laserscanner MRS1104 and the ip address 192.168.0.22 is the computer running linux. Check this with
```bash
ifconfig|grep 192.168.0.22
```
### IP Address of Laser Scanner


:question: Question:
My scanner does not use the default ip address. What shall I do?



:white_check_mark: Answer:
There are two options doing this:
* Permanently:  
Replace the following entry with your ip address.
```bash
  <param name="hostname" type="string" value="192.168.0.1" />
```
* Temporarily  
Use a command line argument in addition to the launch file argument:
```bash
   hostname:=192.168.0.2
```

### Timeout Warning

:question: Question:
During start phase the are warning/error message like
```bash
no answer received after 5000 ms. Maybe sopas mode is wrong.
```
and some more warning/error messages:

:white_check_mark: Answer:
In this case the driver tries to start the scanner in binary mode. If this is not possible, warnings and error messages are generated.
The driver switches the scanner from ASCII mode to binary mode and then restarts communication. The messages can therefore be ignored.
For a long-term solution, we recommend switching from ASCII to binary communication with SOPAS ET under Windows.

### Own Data Handling

:question: Question:
I would like to process data with my own methods.


:white_check_mark: Answer:
Search for keyword "PUBLISH_DATA:" in the code and replace the code for writing
jpeg-files and CSV-files with your own source code.

## Known Issues

* The intensity values in the csv demo file are currently 0.
* If the scanner type is not selected correctly in the launchfile (e.g. launch->mrs_1xxx hardware->tim_5xx) starts the software and then crashes when receiving the first packet with a "bad pointer".

## Creators

**Michael Lehning**

- <http://www.lehning.de>

on behalf of **SICK AG**

- <http://www.sick.com>

------------------------------------------------------------------------

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Logo_SICK_AG_2009.svg/1200px-Logo_SICK_AG_2009.svg.png" width="420">

![Lehning Logo](http://www.lehning.de/style/banner.jpg "LEHNING Logo")
