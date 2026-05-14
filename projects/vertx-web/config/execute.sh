source config/config.sh


#---------Python part-----------#
#cd work
#cd vertx-web/src/test/sockjs-protocol
#rm -f test.log

#cd ..
#cd ..
#cd ..
#cd ..

#---------Java part-----------#
cd work
cd vertx-web
rm -f test.log

cd ..

mvn package 1> mvntest_execute.log 2> /dev/null

cd vertx-web

if [[ $(grep -c "ORBS" test.log) != 0 ]]; then    #execute success
		echo execute success
else
		echo fail> test.log
fi




#rm -f out.log

grep "$1" test.log
