if [ -z "$1" ]
 then
  echo "sets ad5392-5 output to desired voltage"
  echo "usage: output channel raw [calibscale] [calibbias]"
  echo "possible values:"
  echo "        - channel = 0 .. 7"
  echo "        - raw = 0 .. 16383"
  echo "        - calibscale = 0 .. 16383 default 16382"
  echo "        - calibbias = 0 .. 8191 default 0"
  exit 1
 fi
cd /sys/bus/iio/devices/iio:device0
echo $(cat name) says hello!
echo channel $1 choosen
echo raw is to be $2
echo $2 > out_voltage$1_raw
if [ ! -z "$3" ]
 then
  echo calibscale is to be $3
  echo $3 > out_voltage$1_calibscale
 else
   echo 16382 > out_voltage$1_calibscale
fi
if [ ! -z "$4" ]
 then
  echo calibbias is to be $4
  echo $4 > out_voltage$1_calibbias
 else
  echo 0 > out_voltage$1_calibbias
fi
RAW="$(cat out_voltage$1_raw)"
SCALE="$(cat out_voltage_scale)"
CALIBSCALE="$(cat out_voltage$1_calibscale)"
CALIBBIAS="$(cat out_voltage$1_calibbias)"
echo out_voltage_scale = $SCALE
echo out_voltage$1_raw = $RAW
echo out_voltage$1_calibscale = $CALIBSCALE
echo out_voltage$1_calibbias = $CALIBBIAS
PWR="$(echo '2^14' | bc)"
VOLT=$(echo "(($RAW*($CALIBSCALE+2))/$PWR+$CALIBBIAS-8192)*$SCALE" | bc)
echo voltage = $VOLT mV
echo "Done"
