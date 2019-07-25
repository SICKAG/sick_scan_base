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
fping -g 192.168.10.0/24
```
search for all ip addresses from 192.168.10.0 to 192.168.10.255

:question: Question: 
My scanners  do not use the default ip address. How can I parse the scanner ip address to the tool?



:white_check_mark: Answer: 
There are two options doing this:
* Permanently:  
Replace the following entry with your ip address.
```bash
  <param name="hostname" type="string" value="192.168.0.1" />
```
* Temporarily  
Use a command line argument in addition the launch file:
```bash
   hostname:=192.168.0.2
```

## Creators

**Michael Lehning**

- <http://www.lehning.de>

on behalf of **SICK AG**

- <http://www.sick.com>

------------------------------------------------------------------------

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Logo_SICK_AG_2009.svg/1200px-Logo_SICK_AG_2009.svg.png" width="420">

![Lehning Logo](http://www.lehning.de/style/banner.jpg "LEHNING Logo")
