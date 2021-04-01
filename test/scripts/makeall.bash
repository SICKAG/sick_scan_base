#!/bin/bash

# 
# Clean and rebuild sick_scan_base on Linux
# 

pushd ../..
if [ -d ./build_x64 ] ; then rm -rf ./build_x64 ; fi
popd

./make.bash

