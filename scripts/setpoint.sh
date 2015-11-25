if [ -z "$1" ]
 then
  echo "sets setpoint to desired voltage"
  echo "usage: setpoint voltage"
  echo "possible values:"
  echo "        - voltage 0..16383"
 exit 1
 fi

for out in {0..15}
do
        ./gexp.sh $out 1 >> setpoint_log
done

echo "gexp done" >> setpoint_log

for channel in {0..7}
do
        ./output.sh $channel $1 >> setpoint_log
done

echo "output done" >> setpoint_log

echo "Done"
