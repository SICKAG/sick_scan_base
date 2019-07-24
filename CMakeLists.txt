cmake_minimum_required(VERSION 2.8.3)
project(sick_scan_base)
if(WIN32)
include_directories(./pthreads-w32-2-9-1-release/pthreads.2 ../include ../include/tinyxml ../include/sick_scan ${Boost_INCLUDE_DIRS} roswrap/src/include roswrap/src/rossimu/kinetic/include roswrap/src/cfgsimu ${catkin_INCLUDE_DIRS} ${libusb_INCLUDE_DIRS})
else()
include_directories(./include/sick_scan ./include ./include/tinyxml ../include/sick_scan ${Boost_INCLUDE_DIRS} roswrap/src/include roswrap/src/rossimu/kinetic/include roswrap/src/cfgsimu roswrap/src/toojpeg)
endif()

set(CMAKE_BUILD_TYPE Debug)
find_package(Boost COMPONENTS system filesystem thread REQUIRED)
add_definitions(-DHAVE_STRUCT_TIMESPEC -DROSSIMU)

LINK_DIRECTORIES(${Boost_LIBRARY_DIRS})

add_executable(sick_generic_caller
 
	roswrap/src/cfgsimu/sick_scan/time_modi.cpp
	roswrap/src/rossimu/kinetic/src/rossimu.cpp
	roswrap/src/rossimu/kinetic/src/duration.cpp
	roswrap/src/rossimu/kinetic/src/rate.cpp
	roswrap/src/getopt/getopt.c

    roswrap/src/toojpeg/toojpeg.cpp
	
	driver/src/sick_generic_parser.cpp
    driver/src/sick_generic_laser.cpp
    driver/src/sick_generic_caller.cpp
	driver/src/sick_scan_common.cpp
	driver/src/sick_scan_common_nw.cpp
	driver/src/sick_scan_common_tcp.cpp
    driver/src/sick_generic_parser.cpp
	driver/src/binScanf.cpp
	driver/src/dataDumper.cpp

    driver/src/tinyxml/tinystr.cpp
    driver/src/tinyxml/tinyxml.cpp
    driver/src/tinyxml/tinyxmlerror.cpp
    driver/src/tinyxml/tinyxmlparser.cpp

	driver/src/tcp/colaa.cpp
	driver/src/tcp/colab.cpp
	driver/src/tcp/errorhandler.cpp
	driver/src/tcp/Mutex.cpp
	driver/src/tcp/SickThread.cpp
	driver/src/sick_generic_radar.cpp
	driver/src/softwarePLL.cpp
	driver/src/sick_generic_imu.cpp
	driver/src/tcp/tcp.cpp
	driver/src/tcp/toolbox.cpp
        roswrap/src/launchparser/launchparser.cpp roswrap/src/include/launchparser/launchparser.h)
	
if(WIN32)
target_link_libraries(sick_generic_caller ${Boost_LIBRARIES} ../pthreads-w32-2-9-1-release/Pre-built.2/lib/x64/pthreadVC2)
else()
target_link_libraries(sick_generic_caller ${Boost_LIBRARIES} pthread)
endif()

