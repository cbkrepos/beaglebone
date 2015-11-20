if [ -z "$1" ]
 then
  echo "sets pca9539 output in desired logic state"
  echo "usage: gexp output_num logic_state"
  echo "possible values:"
  echo "        - output_num = 0 .. 15"
  echo "        - logic_state = 0 - low / 1 - high"
  echo "program creates log file in user home directory"
  echo "to see the log: cat $HOME/gexp-log"
  exit 1
 fi
echo gexp started >> $HOME/gexp-log
cd /sys/class/gpio
PIN="$(expr 1008 + $1)"         #PIN is gpio number for pin $1 of gpiochip1008
if [ ! -e gpio$PIN ]            #if file gpio$PIN doesnt exist
 then
  echo gpio$PIN file doesnt exist: creating >> $HOME/gexp-log
  echo $PIN > export            #this activates pin $1
fi
if (($1 < 8)); then
OUT="$(echo IO0_$1)"
else
OUT="$(echo IO1_"$(expr $1 - 8)")"
fi
echo setting pin $OUT direction to output >> $HOME/gexp-log
echo setting pin $OUT direction to output
echo out > gpio$PIN/direction #this sets pin MODE0$1 as output
echo setting pin $OUT state to $2 >> $HOME/gexp-log
echo setting pin $OUT state to $2
echo $2 > gpio$PIN/value        #this sets pin MODE0$1 logic state
echo gexp exiting >> $HOME/gexp-log
echo "DONE"

