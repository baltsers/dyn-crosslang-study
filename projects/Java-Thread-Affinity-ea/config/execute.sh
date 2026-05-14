source config/config.sh



cd work
cd affinity
rm -f test.log
cd target
cd classes

sudo cp libCEInternals.so /usr/lib/
cd ..
cd ..
cd ..

mvn package 1> mvntest_execute.log 2> /dev/null

cd affinity

if [[ $(grep -c "ORBS" test.log) != 0 ]]; then    #execute success
		echo execute success
else
		echo fail> test.log
fi




#rm -f out.log

grep "$1" test.log
