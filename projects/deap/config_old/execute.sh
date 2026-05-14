source config/config.sh


cd work

rm -f test.log execute.log

#LC_ALL="en_US" python ./deap/gp.py 1 00 > test.log 2> execute.log
#if [ -z "$(LC_ALL="en_US" python ./deap/gp.py)" ]; then
#	echo "ORBS:1">test.log
#else
#	echo "ORBS:0">test.log
#fi

result=`LC_ALL="en_US" python ./deap/benchmarks/movingpeaks.py`
echo $result> result.log
#echo "result:$result"


if [ $(grep -c "File" result.log) -eq 0 ]; then
		echo $result> test.log
fi

rm -f result.log

grep "$1" test.log