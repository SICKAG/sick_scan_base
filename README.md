# sick_scan_base
Generic driver for SICK laser scanner

This software is a C++ driver for Linux to collect data from an MRS1104 laser scanner. The gathered data is stored at regular intervals as CSV data and as an image file in JPEG format. The image file shows the scan data in the top view.

## Installation

To install, follow the steps below:

1. clone repository
```console
git clone https://github.com/SICKAG/sick_scan_base.git
```
2. create Makefile by using cmake
```console
cd sick_scan_base
cmake .
```
3. compile the software

```console
make
```

## Running

1. Start software e.g. with
```console
sick_generic_call ./launch/sick_mrs_1xxx.launch hostname:=192.168.0.72
```

## Check results
The software starts, connects to the scanner and writes data to the demo directory at regular intervals.
The HTML file image_viewer.html can be loaded into your favorite browser for checking purposes. The generated scan image is then shown in the browser.

## Keywords

MRS1104
MRS1000
MRS1xxx
sick_scan
SICK LiDAR
SICK Laser
SICK Laserscanner
TiM5xx
TiM551
TiM561
TiM571



## Creators

**Michael Lehning**

- <http://www.lehning.de>

on behalf of SICK AG

- <http://www.sick.com>

------------------------------------------------------------------------

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Logo_SICK_AG_2009.svg/1200px-Logo_SICK_AG_2009.svg.png" width="420">

![Lehning Logo](http://www.lehning.de/style/banner.jpg "LEHNING Logo")