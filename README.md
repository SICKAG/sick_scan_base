# sick_scan_base
Generic driver for SICK laser scanner

This software is a C++ driver for Linux to collect data from an MRS1104 laser scanner. The data is stored as a sample application at regular intervals as CSV data and as an image file in JPEG format. The image file shows the scan data in the top view

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
sick_generic_call ./launch/sick_tim_5xx.launch hostname:=192.168.0.72
```

## Check results
The software starts, connects to the scanner and writes data to the demo directory at regular intervals.
The HTML file image_viewer.html can be loaded into your favorite browser for checking purposes. The generated scan image is then shown in the browser.

