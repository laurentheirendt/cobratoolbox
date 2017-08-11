#!/bin/sh
echo "$ARCH"
if [ "$ARCH" == "Linux" ]; then
    /mnt/data/MATLAB/$MATLAB_VER/bin/./matlab -nodesktop -nosplash < test/testAll.m
elif [ "$ARCH" == "macOS" ]; then
    /Applications/MATLAB_$MATLAB_VER.app/bin/matlab -nodesktop -nosplash < test/testAll.m
elif [ "$ARCH" == "Windows" ]; then
    echo " -- Changing to the build directory --"
    cd "D:\jenkins\workspace\COBRAToolbox-windows\MATLAB_VER\R2016b\label\windows-biocore"
    echo "User currently executing:"
    whoami
    echo " -- Launching MATLAB --"
    # create a new output.log file
    touch output.log
    "C:\Program Files\Matlab\R2016b\bin\matlab.exe" -logfile output.log  -r "initCobraToolbox; exit;" #cd test; testAll;  -wait
    tail -f output.log | while read line 
    do
      if echo $line | grep -q 'MATLAB.devTools'; then
        echo 'Done logging.'
        exit 0
      fi
    done
    #cat output.log
fi
CODE=$?
exit $CODE
