source config/config.sh


cd work
cd pyrasite
rm -f test.log




echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope > /dev/null
python test.py> out.log &
pid=$(ps aux|grep test.py|grep -v grep|awk '{print $2}')
result=$(python main.py $pid hello.py)

sleep 1

if [ $(grep -c "Hello" out.log) -eq 1 ]; then    #inject "Hello" succeed
		echo $result> test.log
else
		echo fail> test.log
fi


if ! [ -z $(ps aux|grep test.py|grep -v grep|awk '{print $2}') ]; then
sudo kill $pid
wait $pid 2>/dev/null
fi

#rm -f out.log

grep "$1" test.log