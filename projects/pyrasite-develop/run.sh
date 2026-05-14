echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
python test.py >out.log &
pid=$(ps aux|grep test.py|grep -v grep|awk '{print $2}')
result=$(python main.py $pid hello.py)
echo $pid injected