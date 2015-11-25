#!/bin/bash
#/usr/bin/activ-i2c1.sh
#this script runs from the boot
mkdir /sys/kernel/config/device-tree/overlays/i2c
cat /root/am335x-i2c-1.dtbo > /sys/kernel/config/device-tree/overlays/i2c/dtbo
cd /sys/bus/i2c/devices/i2c-1
echo pca9539 0x74 > new_device
echo ad5392-5 0x54 > new_device
