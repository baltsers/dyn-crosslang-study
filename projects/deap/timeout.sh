timeout() {

    time=$1

    # start the command in a subshell to avoid problem with pipes
    # (spawn accepts one command)
    command="/bin/sh -c \"$2\" "
	echo $time
	echo $command

    expect -c "set echo \"-noecho\"; set timeout $time; spawn -noecho $command; expect timeout { exit 1 } eof { exit 0 }"    

    if [ $? = 1 ] ; then
        echo "Timeout after ${time} seconds"
    fi

}

#/////////////////////////////////////////////////////////////////////////


starttime=`date +%s%N | cut -b1-13`

#your stuff
timeout 86400 bash\ config/orbs.sh   > time.log
#If [ `cat time.log | grep ¡®Timeout¡¯ ]; then


stoptime=`date +%s%N | cut -b1-13`
echo "time spent: " `expr $stoptime - $starttime` milliseconds