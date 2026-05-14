i=3
while [ "$i" -le 10 ]
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 3 ]
then
   sed -e "29 c\ sed -e \"202 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + className);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 4 ]
then
   sed -e "29 c\ sed -e \"287 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + i);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 5 ]
then
   sed -e "29 c\ sed -e \"216 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + args);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 6 ]
then
   sed -e "29 c\ sed -e \"296 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + path);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 7 ]
then
   sed -e "29 c\ sed -e \"287 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + length);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 8 ]
then
   sed -e "29 c\ sed -e \"287 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + bytes);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 9 ]
then
   sed -e "29 c\ sed -e \"201 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + value);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 10 ]
then
   sed -e "29 c\ sed -e \"506 a\\\        try\\\n        {\\\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\n            myout.write(\\\\\"ORBS:\\\\\" + c);\\\n            myout.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\n            myout.flush();\\\n            myout.close();\\\n        }\\\n        catch (final IOException e)\\\n        {\\\n        }\" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java" config/setup.sh > config/setup.sh.tmp
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

