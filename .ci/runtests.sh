#!/bin/sh
if [ $ARCH = "Linux" ]; then
    /mnt/data/MATLAB/$MATLAB_VER/bin/./matlab -nodesktop -nosplash < test/testAll.m
elif [ $ARCH = "macOS" ]; then
    /Applications/MATLAB_$MATLAB_VER.app/bin/matlab -nodesktop -nosplash < test/testAll.m
elif [ $ARCH = "Windows" ]; then
    C:\Program Files\Matlab\$MATLAB_VER\bin\matlab.exe"  -nodesktop -nosplash -r "run('D:\jenkins\workspace\COBRAToolbox-windows\MATLAB_VER\$MATLAB_VER\label\windows-biocore\test\testAll.m')
fi
CODE=$?
exit $CODE
