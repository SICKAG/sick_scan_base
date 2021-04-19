#!/bin/bash

# 
# Build sick_scan_base on Linux
# 

pushd ../..
BUILDLOGFILE=sick_scan_base_build.log
ERRORLOGFILE=sick_scan_base_build_errors.log
USECORES=4
if [ ! -d ./build ] ; then mkdir -p ./build ; fi

cd ./build
rm -f $BUILDLOGFILE
rm -f $ERRORLOGFILE
cmake -G "Unix Makefiles" .. 2>&1 | tee -a $BUILDLOGFILE
make -j$USECORES             2>&1 | tee -a $BUILDLOGFILE

# Check build errors and warnings
grep "warning:" $BUILDLOGFILE   2>&1 | tee -a $ERRORLOGFILE
grep "undefined:" $BUILDLOGFILE 2>&1 | tee -a $ERRORLOGFILE
grep "error:" $BUILDLOGFILE     2>&1 | tee -a $ERRORLOGFILE
echo -e "---" >> $ERRORLOGFILE
echo -e "\nbuild warnings and errors:"
cat $ERRORLOGFILE

if [ ! -f ./sick_generic_caller ] ; then
    echo -e "\n## ERROR building sick_scan_base\n"
else
    echo -e "\nmake sick_scan_base finished."
fi
ls -al ./sick_generic_caller
echo -e "\n" 

popd 

