source config/config.sh


#cd work

cd work

result=`make tests`
echo $result> maketests_result.log

cd tests


if [ $(grep -c "ORBS" test.log) != 0 ]; then    #execute success
		#echo $result> test.log
		echo execute success
else
		echo fail> test.log
fi




#rm -f out.log

grep "$1" test.log
rm -f test.log