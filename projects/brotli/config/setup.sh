# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------Python Part-----------------#
#sed -e "121 a\    fo = open(\"test.log\", \"w\")\n    fo.write(\"ORBS:\"+str(parser))\n    fo.close()" < orig/python/bro.py > work/python/bro.py
#sed -e "38 a\        fo = open(\"test.log\", \"w\")\n        fo.write(\"ORBS:\"+str(stream))\n        fo.close()" < orig/python/bro.py > work/python/bro.py


#-----------------Java Part-----------------#
#sed -e "398 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + offset);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/java/org/brotli/dec/Decode.java > work/java/org/brotli/dec/Decode.java
#sed -e "376 a\        try\n        {\n            final BufferedWriter myout = new BufferedWriter(new FileWriter(\"test.log\", true));\n            myout.write(\"ORBS:\" + s);\n            myout.write(\"\\\n\");\n            myout.flush();\n            myout.close();\n        }\n        catch (final IOException e)\n        {\n        }" < orig/java/org/brotli/dec/Decode.java > work/java/org/brotli/dec/Decode.java



#-----------------C Part-----------------#
#sed -e "206 a\  FILE *fp = NULL;\n  fp = fopen(\"test.log\", \"w+\");\n  fprintf(fp, \"ORBS:%d\",result);\n  fclose(fp);" < orig/c/enc/encode.c > work/c/enc/encode.c
#sed -e "225 a\  FILE *fp = NULL;\n  fp = fopen(\"test.log\", \"w+\");\n  fprintf(fp, \"ORBS:%zu\",htsize);\n  fclose(fp);" < orig/c/enc/encode.c > work/c/enc/encode.c
#sed -e "373 a\  FILE *fp = NULL;\n  fp = fopen(\"test.log\", \"w+\");\n  fprintf(fp, \"ORBS:%zu\",dummy);\n  fclose(fp);" < orig/c/enc/encode.c > work/c/enc/encode.c
#sed -e "165 a\  FILE *fp = NULL;\n  fp = fopen(\"test.log\", \"w+\");\n  fprintf(fp, \"ORBS:%d\",n);\n  fclose(fp);" < orig/c/dec/decode.c > work/c/dec/decode.c
#sed -e "190 a\  FILE *fp = NULL;\n  fp = fopen(\"test.log\", \"w+\");\n  fprintf(fp, \"ORBS:%d\",bits);\n  fclose(fp);" < orig/c/dec/decode.c > work/c/dec/decode.c
#sed -e "508 a\  FILE *fp = NULL;\n  fp = fopen(\"test.log\", \"w+\");\n  fprintf(fp, \"ORBS:%d\",i);\n  fclose(fp);" < orig/c/dec/decode.c > work/c/dec/decode.c

# cd work
# mkdir out && cd out
# ../configure-cmake 1> /dev/null 2> /dev/null

#-----------------auto insert Part-----------------#



cd work
mkdir out && cd out
../configure-cmake 1> /dev/null 2> /dev/null