for((i=5;i<=6;i++));  
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 3 ]
then
   sed -e "23 c\ sed -e \"195 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\\n            out.write(\\\\\"ORBS: \\\\\" + port);\\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\\n            out.flush();\\\\n            out.close();\\\\n        } catch (IOException e) {\\\\n        }\" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 4 ]
then
   sed -e "23 c\ sed -e \"195 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\\n            out.write(\\\\\"ORBS: \\\\\" + host);\\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\\n            out.flush();\\\\n            out.close();\\\\n        } catch (IOException e) {\\\\n        }\" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 5 ]
then
   sed -e "23 c\ sed -e \"92 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\\n            out.write(\\\\\"ORBS: \\\\\" + c);\\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\\n            out.flush();\\\\n            out.close();\\\\n        } catch (IOException e) {\\\\n        }\" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 6 ]
then
   sed -e "23 c\ sed -e \"142 a\\\        try {\\\n            BufferedWriter out = new BufferedWriter(new FileWriter(\\\\\"test.log\\\\\", true));\\\\n            out.write(\\\\\"ORBS: \\\\\" + sep0);\\\\n            out.write(\\\\\"\\\\\\\\\\\n\\\\\");\\\\n            out.flush();\\\\n            out.close();\\\\n        } catch (IOException e) {\\\\n        }\" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
fi

sudo bash timeout.sh

sudo mv work $i/
sudo mv debug.log $i/
sudo mv oracle.log $i/
sudo mv orbs.log $i/
sudo mv output.log $i/
sudo mv TimeUsage.log $i/
done 

#sed -e "195 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + port);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java
#sed -e "195 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + host);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java
#sed -e "92 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + c);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java
#sed -e "142 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + sep0);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java

