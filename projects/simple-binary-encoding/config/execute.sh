source config/config.sh


cd work
#-------- cpp part --------------#
# cd cppbuild/Release/generated/cpp


# if [[ $(grep -c "ORBS" test.log) != 0 ]]; then    #execute success
		# echo execute success
# else
		# echo fail> test.log
# fi


# grep "$1" test.log
# rm -f test.log

#-------- java part -------------#
i=0
if [  -f "./sbe-all/test.log" ]; then
grep "$1" ./sbe-all/test.log
rm -f ./sbe-all/test.log
i=1
fi

if [  -f "./sbe-benchmarks/test.log" ]; then
grep "$1" ./sbe-benchmarks/test.log
rm -f ./sbe-benchmarks/test.log
i=1
fi

if [  -f "./sbe-samples/test.log" ]; then
grep "$1" ./sbe-samples/test.log
rm -f ./sbe-samples/test.log
i=1
fi

if [  -f "./sbe-tool/test.log" ]; then
grep "$1" ./sbe-tool/test.log
rm -f ./sbe-tool/test.log
i=1
fi

if [ $i == 0 ]; then
echo fail
fi
