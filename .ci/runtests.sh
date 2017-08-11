#!/bin/sh
echo "$ARCH"
if [ "$ARCH" == "Linux" ]; then
    /mnt/data/MATLAB/$MATLAB_VER/bin/./matlab -nodesktop -nosplash < test/testAll.m
elif [ "$ARCH" == "macOS" ]; then
    /Applications/MATLAB_$MATLAB_VER.app/bin/matlab -nodesktop -nosplash < test/testAll.m
elif [ "$ARCH" == "Windows" ]; then
    echo " -- Changing to the build directory --"
    cd "D:\jenkins\workspace\COBRAToolbox-windows\MATLAB_VER\R2016b\label\windows-biocore\test"
    echo "User currently executing:"
    whoami
    echo " -- Launching MATLAB --"
    touch output.log
    tail -f output.log
    "C:\Program Files\Matlab\R2016b\bin\matlab.exe" -logfile output.log -wait -r "testAll; exit;"
    #cat output.log
fi
CODE=$?
exit $CODE
