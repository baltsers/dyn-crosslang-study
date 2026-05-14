# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------C++ Part-----------------#
#sed -e "1041 a\    std::ofstream myoutfile(\"test.log\");\n    myoutfile<<\"ORBS:\"<<m_eventNumber<<std::endl;\n    myoutfile.close();" < orig/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp > work/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp
#sed -e "569 a\    std::ofstream myoutfile(\"test.log\");\n    myoutfile<<\"ORBS:\"<<name<<std::endl;\n    myoutfile.close();" < orig/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp > work/sbe-tool/src/test/cpp/Rc3OtfFullIrTest.cpp



#-----------------Java Part-----------------#
#sed -e "202 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + className);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java
#sed -e "287 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + i);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/generation/java/JavaGenerator.java
#sed -e "216 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + args);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java
#sed -e "296 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + path);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/SbeTool.java
sed -e "287 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + length);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java
#sed -e "287 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + bytes);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/PrimitiveValue.java
#sed -e "201 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + value);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java
#sed -e "506 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + c);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java > work/sbe-tool/src/main/java/uk/co/real_logic/sbe/ValidationUtil.java


#-----------------auto insert Part-----------------#



