# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------C Part-----------------
#sed -e "71 a\    std::ofstream outfile(\"test.log\");\n    outfile<<\"ORBS:\"<<size<<std::endl;\n    outfile.close();" < orig/affinity/src/main/c/software_chronicle_enterprise_internals_impl_NativeAffinity.cpp > work/affinity/src/main/c/software_chronicle_enterprise_internals_impl_NativeAffinity.cpp
#sed -e "71 a\    std::ofstream outfile(\"test.log\");\n    outfile<<\"ORBS:\"<<sched_getcpu()<<std::endl;\n    outfile.close();" < orig/affinity/src/main/c/software_chronicle_enterprise_internals_impl_NativeAffinity.cpp > work/affinity/src/main/c/software_chronicle_enterprise_internals_impl_NativeAffinity.cpp

#-----------------Java Part-----------------
#sed -e "389 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + cpuId);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/AffinityLock.java > work/affinity/src/main/java/net/openhft/affinity/AffinityLock.java
#sed -e "254 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + lastN);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/AffinityLock.java > work/affinity/src/main/java/net/openhft/affinity/AffinityLock.java
#sed -e "98 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + layoutId);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/LockInventory.java > work/affinity/src/main/java/net/openhft/affinity/LockInventory.java
#sed -e "54 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + i);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/LockInventory.java > work/affinity/src/main/java/net/openhft/affinity/LockInventory.java
#sed -e "120 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + cpu);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/LockCheck.java > work/affinity/src/main/java/net/openhft/affinity/LockCheck.java
#sed -e "108 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + core);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/LockCheck.java > work/affinity/src/main/java/net/openhft/affinity/LockCheck.java
#sed -e "53 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + cpuId);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/AffinityStrategies.java > work/affinity/src/main/java/net/openhft/affinity/AffinityStrategies.java
sed -e "53 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + cpuLayout);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/affinity/src/main/java/net/openhft/affinity/AffinityStrategies.java > work/affinity/src/main/java/net/openhft/affinity/AffinityStrategies.java

















