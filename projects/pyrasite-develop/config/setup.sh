# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#sed -e "36 a\        print \'ORBS:\',value" < orig/pyrasite/main.py > work/pyrasite/main.py
#sed -e "131 a\    print \'ORBS:\',filename" < orig/pyrasite/main.py > work/pyrasite/main.py
#sed -e "66 a\        print \'ORBS:\',fn" < orig/pyrasite/main.py > work/pyrasite/main.py
#sed -e "39 a\    print \'ORBS:\',filename" < orig/pyrasite/injector.py > work/pyrasite/injector.py  
#sed -e "39 a\    print \'ORBS:\',gdb_cmds" < orig/pyrasite/injector.py > work/pyrasite/injector.py   
#sed -e "206 a\        print \'ORBS:\',data" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py
#sed -e "195 a\                print \'ORBS:\',msg_len" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py
#sed -e "185 a\        print \'ORBS:\',data" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py

#sed -e "48 a\	cout<<\"ORBS:\"<<retCode<<endl;" < orig/pyrasite/win/inject_python.cpp > work/pyrasite/win/inject_python.cpp
sed -e '48 a\	printf("\\nORBS:%d\\n", retCode);' < orig/pyrasite/win/inject_python.cpp > work/pyrasite/win/inject_python.cpp
#sed -e '263 a\	printf("\\nORBS:%d\\n", ret);' < orig/pyrasite/win/inject_python.cpp > work/pyrasite/win/inject_python.cpp












