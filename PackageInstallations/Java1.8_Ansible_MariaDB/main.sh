#!/bin/bash
FILE=redhat.sh
FILE1=debian.sh
if [ `which yum` ]; then
        if [  -f "$FILE"  ]; then
            IS_RHEL=1
            echo "OS belongs to RHEL Family"
            echo "Running the installations."
            sh -x ./redhat.sh
        else
            echo "File not present"
        fi
elif [ `which apt` ]; then
        if [ -f "$FILE1" ]; then
                IS_UBUNTU=1
                echo "OS belongs to DEBIAN Family"
                echo "Running the installations."
                sh -x ./debian.sh
        else
                echo "File not present"
        fi
else
   IS_UNKNOWN=1
fi
