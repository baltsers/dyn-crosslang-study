# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------C++ Part-----------------#
#sed -e "103 a\    std::ofstream outfile(\"test.log\");\n    outfile<<\"ORBS:\"<<in<<std::endl;\n    outfile.close();" < orig/src/main/java/org/xerial/snappy/SnappyNative.cpp > work/src/main/java/org/xerial/snappy/SnappyNative.cpp
#sed -e "102 a\    std::ofstream outfile(\"test.log\");\n    outfile<<\"ORBS:\"<<out<<std::endl;\n    outfile.close();" < orig/src/main/java/org/xerial/snappy/SnappyNative.cpp > work/src/main/java/org/xerial/snappy/SnappyNative.cpp
#sed -e "57 a\    std::ofstream outfile(\"test.log\");\n    outfile<<\"ORBS:\"<<processedBytes<<std::endl;\n    outfile.close();" < orig/src/main/java/org/xerial/snappy/BitShuffleNative.cpp > work/src/main/java/org/xerial/snappy/BitShuffleNative.cpp
sed -e "129 a\    std::ofstream outfile(\"test.log\");\n    outfile<<\"ORBS:\"<<processedBytes<<std::endl;\n    outfile.close();" < orig/src/main/java/org/xerial/snappy/BitShuffleNative.cpp > work/src/main/java/org/xerial/snappy/BitShuffleNative.cpp


#-----------------Java Part-----------------#
#sed -e "79 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + uLen);\n            out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/BitShuffle.java > work/src/main/java/org/xerial/snappy/BitShuffle.java
#sed -e "192 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + typeSize);\n            out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/BitShuffle.java > work/src/main/java/org/xerial/snappy/BitShuffle.java
#sed -e "554 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + cPos);\n            out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/Snappy.java > work/src/main/java/org/xerial/snappy/Snappy.java
#sed -e "796 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + uncompressedLength);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/Snappy.java > work/src/main/java/org/xerial/snappy/Snappy.java
#sed -e "230 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + ch);\n            out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/SnappyLoader.java > work/src/main/java/org/xerial/snappy/SnappyLoader.java
#sed -e "230 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + ch2);\n            out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/SnappyLoader.java > work/src/main/java/org/xerial/snappy/SnappyLoader.java



#-----------------auto insert Part-----------------#
 #sed -e "554 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + cPos);\n            out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/xerial/snappy/Snappy.java > work/src/main/java/org/xerial/snappy/Snappy.java
