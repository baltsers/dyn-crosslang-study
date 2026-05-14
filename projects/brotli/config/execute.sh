source config/config.sh


cd work
#-------- python part --------------#
# cd python
# rm -f test.log
# make test 1> make_execute.log 2> /dev/null

# grep "$1" test.log

#-------- java part -------------#
# cd java/org/brotli
# mvn test 1> execute_result.log 2> /dev/null
# cd dec
# grep "$1" test.log
# rm -f test.log


#-------- cpp part --------------#
cd python
rm -f test.log
make test 1> make_execute.log 2> /dev/null
grep "$1" test.log

cd ..

cd java/org/brotli
mvn test 1> execute_result.log 2> /dev/null
cd dec
grep "$1" test.log
rm -f test.log

cd ../../../..

cd out
make test 1> execute_result.log 2> /dev/null
grep "$1" test.log
rm -f test.log


