starttime=`date +%s%N | cut -b1-13`


bash config/orbs.sh
#echo $(ls) > output.log

stoptime=`date +%s%N | cut -b1-13`



mytime=$(expr $stoptime - $starttime)
echo $mytime ms
