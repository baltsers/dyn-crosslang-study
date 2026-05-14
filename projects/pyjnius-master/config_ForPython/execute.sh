source config/config.sh


#cd work
rm -f test.log


result=`sudo python3.8 ex2.py`
echo $result> result.log


if [ $(grep -c "Hello" result.log) -eq 1 ]; then    #execute ex2.py success
		echo $result> test.log
else
		echo fail> test.log
fi




#rm -f out.log

grep "$1" test.log