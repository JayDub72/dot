#!/bin/bash

# assign variables to inputs
if [ $# != 0 ]
  then
    vmID="$1"
  else

    # prompt for vmID to create
    read -p "Enter VM ID: " vmID
fi

sudo qm guest exec "$vmID" -- truncate -s 0 /etc/machine-id
sudo qm guest exec "$vmID" -- rm /var/lib/dbus/machine-id
sudo qm guest exec "$vmID" -- ln -s /etc/machine-id /var/lib/dbus/machine-id

sudo qm stop "$vmID"
sudo qm start "$vmID"

