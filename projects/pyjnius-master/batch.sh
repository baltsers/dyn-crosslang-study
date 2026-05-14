for((i=3;i<=8;i++));  
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 3 ]
then
   sed -e "30 c\ sed -e \"66 a\\\        print \\\'ORBS:\\\',fn\" < orig/pyrasite/main.py > work/pyrasite/main.py" config/setup.sh > config/setup.sh.tmp
   mv config/setup.sh.tmp config/setup.sh
elif [ $i == 4 ]
then
   sed -e "30 c\ sed -e \"39 a\\\    print \\\'ORBS:\\\',filename\" < orig/pyrasite/injector.py > work/pyrasite/injector.py" config/setup.sh > config/setup.sh.tmp
   mv config/setup.sh.tmp config/setup.sh
elif [ $i == 5 ]
then
   sed -e "30 c\ sed -e \"39 a\\\    print \\\'ORBS:\\\',gdb_cmds\" < orig/pyrasite/injector.py > work/pyrasite/injector.py" config/setup.sh > config/setup.sh.tmp
   mv config/setup.sh.tmp config/setup.sh
elif [ $i == 6 ]
then
   sed -e "30 c\ sed -e \"206 a\\\        print \\\'ORBS:\\\',data\" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py" config/setup.sh > config/setup.sh.tmp
   mv config/setup.sh.tmp config/setup.sh
elif [ $i == 7 ]
then
   sed -e "30 c\ sed -e \"195 a\\\                print \\\'ORBS:\\\',msg_len\" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py" config/setup.sh > config/setup.sh.tmp
   mv config/setup.sh.tmp config/setup.sh
elif [ $i == 8 ]
then
   sed -e "30 c\ sed -e \"185 a\\\        print \\\'ORBS:\\\',data\" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py" config/setup.sh > config/setup.sh.tmp
   mv config/setup.sh.tmp config/setup.sh
fi

sudo bash timeout.sh

sudo mv work $i/
sudo mv debug.log $i/
sudo mv oracle.log $i/
sudo mv orbs.log $i/
sudo mv output.log $i/
sudo mv TimeUsage.log $i/
done 

#sed -e "36 a\        print \'ORBS:\',value" < orig/pyrasite/main.py > work/pyrasite/main.py
#sed -e "131 a\    print \'ORBS:\',filename" < orig/pyrasite/main.py > work/pyrasite/main.py
#sed -e "66 a\        print \'ORBS:\',fn" < orig/pyrasite/main.py > work/pyrasite/main.py
#sed -e "39 a\    print \'ORBS:\',filename" < orig/pyrasite/injector.py > work/pyrasite/injector.py  
#sed -e "39 a\    print \'ORBS:\',gdb_cmds" < orig/pyrasite/injector.py > work/pyrasite/injector.py   
#sed -e "206 a\        print \'ORBS:\',data" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py
#sed -e "195 a\                print \'ORBS:\',msg_len" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py
#sed -e "185 a\        print \'ORBS:\',data" < orig/pyrasite/ipc.py > work/pyrasite/ipc.py