#==========================================================
#
# Project: sick_scan_base
#
#==========================================================
cmake_minimum_required(VERSION 2.8.3)
project(sick_scan_base)

set(CMAKE_BUILD_TYPE Debug)
if(WIN32)
# ---------- Find Boost Headers/Libraries -----------------------
SET (Boost_FIND_REQUIRED TRUE)
SET (Boost_FIND_QUIETLY TRUE)
SET (Boost_DEBUG FALSE)
set (Boost_USE_MULTITHREADED TRUE)
set (Boost_USE_STATIC_LIBS TRUE)
SET (Boost_ADDITIONAL_VERSIONS "1.65" "1.65.1")

set(Boost_INCLUDE_DIR $ENV{USERPROFILE}/Documents/development/boost_1_65_1)
set(Boost_DIR $ENV{USERPROFILE}/Documents/development/boost_1_65_1)
set(Boost_LIBRARY_DIR $ENV{USERPROFILE}/Documents/development/boost_1_65_1/stage/lib)
endif()

find_package(Boost COMPONENTS system filesystem thread REQUIRED)

add_definitions(-DHAVE_STRUCT_TIMESPEC -DROSSIMU)

if(WIN32)
# include_directories(roswrap/pthread_win/pthreads-w32-2-9-1-release/pthreads.2 roswrap/helper_win ./include ./include/tinyxml ./include/sick_scan ${Boost_INCLUDE_DIRS} roswrap/src/include roswrap/src/rossimu/kinetic/include roswrap/src/cfgsimu roswrap/src/toojpeg )
include_directories(C:/Users/micha/Documents/development/vcpkg/installed/x64-windows/include roswrap/helper_win ./include ./include/tinyxml ./include/sick_scan ${Boost_INCLUDE_DIRS} roswrap/src/include roswrap/src/rossimu/kinetic/include roswrap/src/cfgsimu roswrap/src/toojpeg )
else()
include_directories(./include/sick_scan ./include ./include/tinyxml ../include/sick_scan ${Boost_INCLUDE_DIRS} roswrap/src/include roswrap/src/rossimu/kinetic/include roswrap/src/cfgsimu roswrap/src/toojpeg)
endif()


LINK_DIRECTORIES(${Boost_LIBRARY_DIRS})


if(WIN32)
    file(GLOB SRC_WIN_FILES roswrap/helper_win/usleep/usleep.c)
else()
    file(GLOB SRC_WIN_FILES )
endif()
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
    roswrap/src/launchparser/launchparser.cpp roswrap/src/include/launchparser/launchparser.h
	${SRC_WIN_FILES}
	)
	
if(WIN32)
message("### Compiled for Windows x64")
# target_link_libraries(sick_generic_caller ${Boost_LIBRARIES}  C:/Users/micha/Documents/development/vcpkg/packages/pthreads_x64-windows/lib/pthreadVC3.lib)
target_link_libraries(sick_generic_caller ${Boost_LIBRARIES} )
else()
target_link_libraries(sick_generic_caller ${Boost_LIBRARIES} pthread)
endif()

