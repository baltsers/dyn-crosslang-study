timeout() {

    settime=$1

    # start the command in a subshell to avoid problem with pipes
    # (spawn accepts one command)
    command="/bin/sh -c \"$2\" "
	echo $settime
	echo $command

    expect -c "set echo \"-noecho\"; set timeout $settime; spawn -noecho $command; expect timeout { exit 1 } eof { exit 0 }"    

    if [ $? = 1 ] ; then
        echo "Timeout after ${settime} seconds"
    fi

}

#/////////////////////////////////////////////////////////////////////////
time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"

echo Running ORBS...

starttime=`date +%s%N | cut -b1-13`

#Set time 86400s(24hrs)
timeout 86400 bash\ config/orbs.sh   > output.log
#If [ `cat time.log | grep ¡®Timeout¡¯ ]; then


stoptime=`date +%s%N | cut -b1-13`

echo ORBS Finished 

#echo "time spent: " `expr $stoptime - $starttime` ms
mytime=$(expr $stoptime - $starttime)
echo $mytime ms
echo "time spent: " $mytime ms = $(echo "scale=4; $mytime/60000" | bc) mins = $(echo "scale=4; $mytime/3600000" | bc) hrs > TimeUsage.log