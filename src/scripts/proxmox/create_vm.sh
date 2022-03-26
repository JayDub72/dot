#!/bin/bash

# assign variables to inputs
if [ $# != 0 ]
  then
    vmID="$1"
    vmName="$2"
    templateID="$3"
  else

    # prompt for vmID to create
    read -p "Enter new VM ID: " vmID
    read -p "Enter new VM Name: " vmName
    read -p "Enter Cloud Init Template to use: " templateID
fi

sudo qm clone "$templateID" "$vmID" --name "$vmName"
sudo qm resize "$vmID" scsi0 +10G

sudo qm start "$vmID"
