i=5
while [ "$i" -le 10 ]
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 5 ]
then
   sed -e "28 c\ sed -e \"79 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            out.write(\\\\\"ORBS: \\\\\" + uLen);\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            out.flush();\\\n            out.close();\\\n        } catch (IOException e) {\\\n        }\" < orig/src/main/java/org/xerial/snappy/BitShuffle.java > work/src/main/java/org/xerial/snappy/BitShuffle.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 6 ]
then
   sed -e "28 c\ sed -e \"192 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            out.write(\\\\\"ORBS: \\\\\" + typeSize);\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            out.flush();\\\n            out.close();\\\n        } catch (IOException e) {\\\n        }\" < orig/src/main/java/org/xerial/snappy/BitShuffle.java > work/src/main/java/org/xerial/snappy/BitShuffle.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 7 ]
then
   sed -e "28 c\ sed -e \"554 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            out.write(\\\\\"ORBS: \\\\\" + cPos);\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            out.flush();\\\n            out.close();\\\n        } catch (IOException e) {\\\n        }\" < orig/src/main/java/org/xerial/snappy/Snappy.java > work/src/main/java/org/xerial/snappy/Snappy.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 8 ]
then
   sed -e "28 c\ sed -e \"796 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            out.write(\\\\\"ORBS: \\\\\" + uncompressedLength);\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            out.flush();\\\n            out.close();\\\n        } catch (IOException e) {\\\n        }\" < orig/src/main/java/org/xerial/snappy/Snappy.java > work/src/main/java/org/xerial/snappy/Snappy.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 9 ]
then
   sed -e "28 c\ sed -e \"230 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            out.write(\\\\\"ORBS: \\\\\" + ch);\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            out.flush();\\\n            out.close();\\\n        } catch (IOException e) {\\\n        }\" < orig/src/main/java/org/xerial/snappy/SnappyLoader.java > work/src/main/java/org/xerial/snappy/SnappyLoader.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 10 ]
then
   sed -e "28 c\ sed -e \"230 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            out.write(\\\\\"ORBS: \\\\\" + ch2);\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            out.flush();\\\n            out.close();\\\n        } catch (IOException e) {\\\n        }\" < orig/src/main/java/org/xerial/snappy/SnappyLoader.java > work/src/main/java/org/xerial/snappy/SnappyLoader.java" config/setup.sh > config/setup.sh.tmp
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

####
