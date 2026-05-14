i=3
while [ "$i" -le 4 ]
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 3 ]
then
   sed -e "34 c\ sed -e \"398 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + offset);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/java/org/brotli/dec/Decode.java > work/java/org/brotli/dec/Decode.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 4 ]
then
   sed -e "34 c\ sed -e \"376 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + s);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/java/org/brotli/dec/Decode.java > work/java/org/brotli/dec/Decode.java" config/setup.sh > config/setup.sh.tmp
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

