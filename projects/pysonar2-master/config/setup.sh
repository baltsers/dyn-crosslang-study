# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------Python Part-----------------
#sed -e "91 a\    f = open('test.log','a')\n    f.write(\"ORBS:\"+str(encs)+\"\\\n\")\n    f.close()" < orig/src/main/resources/org/yinwang/pysonar/python/dump_python.py > work/src/main/resources/org/yinwang/pysonar/python/dump_python.py
sed -e "138 a\    f = open('test.log','a')\n    f.write(\"ORBS:\"+str(col)+\"\\\n\")\n    f.close()" < orig/src/main/resources/org/yinwang/pysonar/python/dump_python.py > work/src/main/resources/org/yinwang/pysonar/python/dump_python.py


#-----------------Java Part-----------------
#sed -e "27 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + start);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/ast/Call.java > work/src/main/java/org/yinwang/pysonar/ast/Call.java
#sed -e "580 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + nDef);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/Analyzer.java > work/src/main/java/org/yinwang/pysonar/Analyzer.java
#sed -e "103 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + start);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/Binding.java > work/src/main/java/org/yinwang/pysonar/Binding.java
#sed -e "166 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + b);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/State.java > work/src/main/java/org/yinwang/pysonar/State.java
#sed -e "76 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + col);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/ast/ImportFrom.java > work/src/main/java/org/yinwang/pysonar/ast/ImportFrom.java
#sed -e "941 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + logCount);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/Parser.java > work/src/main/java/org/yinwang/pysonar/Parser.java
#sed -e "712 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + start);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/Parser.java > work/src/main/java/org/yinwang/pysonar/Parser.java
#sed -e "914 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + nstart);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/src/main/java/org/yinwang/pysonar/Parser.java > work/src/main/java/org/yinwang/pysonar/Parser.java


















