source config/config.sh



cd work
rm -f test.log

mvn test 1> mvntest_result.log 2> /dev/null



if [ $(grep -c "ORBS" test.log) != 0 ]; then    #execute success
		echo execute success
else
		echo fail> test.log
fi




#rm -f out.log

grep "$1" test.log
