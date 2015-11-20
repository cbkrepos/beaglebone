#!/bin/sh
#this will activate i2c-1 interface
mkdir /sys/kernel/config/device-tree/overlays/i2c
cat /root/am335x-bone-i2c1.dtbo > /sys/kernel/config/device-tree/overlays/i2c/dtbo
i2cdetect -l
#this will load pca9539 driver
cd /root/linux-stable-rcn-ee/drivers/gpio
insmod gpio-pca953x.ko
cp gpio-pca953x.ko /lib/modules/4.2.3-armv7-x2/kernel/drivers/gpio
modprobe gpio-pca953x
lsmod
cd /sys/bus/i2c/devices/i2c-1
echo pca9539 0x74 > new_device

