# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------Python Part-----------------
#sed -e "215 a\    print(\'ORBS:\',cpu)" < orig/jnius/env.py > work/jnius/env.py
#sed -e "143 a\    print(\'ORBS:\',jdk_home)" < orig/jnius/env.py > work/jnius/env.py
#sed -e "114 a\    print(\'ORBS:\',jre_home)" < orig/jnius/env.py > work/jnius/env.py
#sed -e "253 a\    print(\'ORBS:\',root)" < orig/jnius/env.py > work/jnius/env.py
#sed -e "293 a\    print(\'ORBS:\',cls)" < orig/jnius/reflect.py > work/jnius/reflect.py
#sed -e "235 a\    print(\'ORBS:\',c)" < orig/jnius/reflect.py > work/jnius/reflect.py
#sed -e "210 a\    print(\'ORBS:\',supercls)" < orig/jnius/reflect.py > work/jnius/reflect.py
#sed -e "359 a\                print(\'ORBS:\',sig)" < orig/jnius/reflect.py > work/jnius/reflect.py

#-----------------Java Part-----------------
sed -e "13 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + method);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/jnius/src/org/jnius/NativeInvocationHandler.java > work/jnius/src/org/jnius/NativeInvocationHandler.java
#sed -e "32 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + DEBUG);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/jnius/src/org/jnius/NativeInvocationHandler.java > work/jnius/src/org/jnius/NativeInvocationHandler.java

















