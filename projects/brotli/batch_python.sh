i=1
while [ "$i" -le 2 ]
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 1 ]
then
   sed -e "34 c\ sed -e \"121 a\\\    fo = open(\\\\\"test.log\\\\\", \\\\\"w\\\\\")\\\n    fo.write(\\\\\"ORBS:\\\\\"+str(parser))\\\n    fo.close()\" < orig/python/bro.py > work/python/bro.py" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 2 ]
then
   sed -e "34 c\ sed -e \"38 a\\\        fo = open(\\\\\"test.log\\\\\", \\\\\"w\\\\\")\\\n        fo.write(\\\\\"ORBS:\\\\\"+str(stream))\\\n        fo.close()\" < orig/python/bro.py > work/python/bro.py" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh

fi

sudo bash timeout.sh

sleep 3
sudo mv work $i/
sudo mv debug.log $i/
sudo mv oracle.log $i/
sudo mv orbs.log $i/
sudo mv output.log $i/
sudo mv TimeUsage.log $i/
i=$((i+1))
done 

#
#
