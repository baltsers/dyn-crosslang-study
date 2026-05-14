i=1
while [ "$i" -le 2 ]
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 1 ]
then
   sed -e "29 c\ sed -e \"1041 a\\\    std::ofstream outfile(\\\\\"test.log\\\\\");\\\n    outfile<<\\\\\"ORBS:\\\\\"<<m_eventNumber<<std::endl;\\\n    outfile.close();\" < orig/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp > work/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 2 ]
then
   sed -e "29 c\ sed -e \"569 a\\\    std::ofstream outfile(\\\\\"test.log\\\\\");\\\n    outfile<<\\\\\"ORBS:\\\\\"<<name<<std::endl;\\\n    outfile.close();\" < orig/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp > work/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp" config/setup.sh > config/setup.sh.tmp
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

