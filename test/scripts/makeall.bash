#!/bin/bash

# 
# Clean and rebuild sick_scan_base on Linux
# 

pushd ../..
if [ -d ./build ] ; then rm -rf ./build ; fi
popd

./make.bash

