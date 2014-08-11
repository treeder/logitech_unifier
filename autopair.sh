#!/bin/bash
#
# Autopair script for Logitch Unified Reciever
# David Mcanulty 2012
# tsaavik@hellspark.com
#
#
#
device_name="Logitech Unified Reciever"
unify_binary="unify"

if [[ ! -s ${unify_binary} ]]; then
   echo "${device_name} ${unify_binary} binary not compiled, attempting compilation"
   if gcc -o ${unify_binary} ${unify_binary}.c ;then
      echo "${device_name} ${unify_binary} binary was successfully compiled"
   else
      echo "Sorry, there was an error compiling the ${device_name} ${unify_binary} binary: $!"
      exit 1
   fi
fi

if [[ -x ${unify_binary} ]]; then
   chmod +x ${unify_binary}
else
   echo "Sorry, there was an error setting the ${device_name} ${unify_binary} binary executable: $!"
   exit
fi


echo "Auto-discovering ${device_name}"
hid_raw="$(grep -H "HID_NAME=Logitech USB Receiver" /sys/class/hidraw/hidraw?/device/uevent  |awk -F'/' '{print $5}')"
device="/dev/${hid_raw}"

if [[ -c ${device} ]]; then
   echo "Logitech Unified Reciever found on ${device}!"
fi

read -p "Turn off the device you wish to pair and then press enter"
if sudo ./${unify_binary} ${device} ;then
   :
else
   echo "And error occured when trying to run the ${device_name} binary, sorry: $!"
   exit 1
fi


