#!/bin/sh
#this will activate i2c-1 interface
mkdir /sys/kernel/config/device-tree/overlays/i2c
cat am335x-bone-i2c1.dtbo > /sys/kernel/config/device-tree/overlays/i2c/dtbo
i2cdetect -l
#this will load ad5380 driver
cd linux-stable-rcn-ee/drivers/iio/dac
modprobe industrialio
insmod ad5380.ko
cp ad5380.ko /lib/modules/4.2.3-armv7-x2/kernel/drivers/iio/dac
modprobe ad5380
lsmod
cd /sys/bus/i2c/devices/i2c-1
echo ad5392-5 0x54 > new_device
cd /sys/bus/iio/devices/iio:device0
ls
alias cd_dac="cd /sys/bus/iio/devices/iio:device0"
alias output="./output.sh"
echo "Done"
