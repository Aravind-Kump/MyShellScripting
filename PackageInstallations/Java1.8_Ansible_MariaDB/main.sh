#!/bin/bash
if [[ `which yum` ]]; then
   IS_RHEL=1
   echo "OS belongs to RHEL Family"
   echo "Running the installations."
   sh -x ./redhat.sh
elif [[ `which apt` ]]; then
   IS_UBUNTU=1
   echo "OS belongs to DEBIAN Family"
   echo "Running the installations."
   sh -x ./debian.sh
else
   IS_UNKNOWN=1
fi