#!/bin/sh
echo "$ARCH"
if [ "$ARCH" == "Linux" ]; then
    /mnt/data/MATLAB/$MATLAB_VER/bin/./matlab -nodesktop -nosplash < test/testAll.m
elif [ "$ARCH" == "macOS" ]; then
    /Applications/MATLAB_$MATLAB_VER.app/bin/matlab -nodesktop -nosplash < test/testAll.m
elif [ "$ARCH" == "Windows" ]; then
    echo " -- Changing to the build directory --"
    cd "D:\jenkins\workspace\COBRAToolbox-windows\MATLAB_VER\R2016b\label\windows-biocore"
    whoami
    echo "Kill sh.exe"
    "C:\Windows\System32\cmd.exe" /c /F /IM "sh.exe"
    "C:\Windows\System32\cmd.exe" /c /F /IM "ssh-agent.exe"
    echo " -- Launching MATLAB --"
    nohup "C:\Program Files\Matlab\R2016b\bin\matlab.exe" -useStartupFolderPref -logfile output.log -wait -r "fprintf('%s\n', getenv('USERPROFILE')); pwd; initCobraToolbox; exit;" & #cd test; testAll;
    tail -n0 -F --pid=$! output.log 2>/dev/null
fi

CODE=$?
exit $CODE
