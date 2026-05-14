source config/config.sh


cd work
cd pyrasite
rm -f test.log




#echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope > /dev/null
python test.py> out.log &
pid=$(ps aux|grep cons0|grep Python|grep -v grep|awk '{print $4}')
#array=(${pid// / })


# for var in ${array[@]}
# do
   # echo $var
# done 
result=$(python main.py $pid hello.py --verbose)

sleep 1



winpid=$(ps aux|grep cons0|grep Python|grep -v grep|awk '{print $1}')
#array2=(${winpid// / })
if [[ $winpid!=0 ]]; 
then
#sudo kill $pid
kill $winpid
#wait $winpid 2>/dev/null
fi


if [ $(grep -c "Hello" out.log) -eq 1 ]; then    #inject "Hello" succeed
		echo $result> test.log
else
		echo fail> test.log
fi


#rm -f out.log

grep "$1" test.log