i=5
while [ "$i" -le 10 ]
do
echo start $i
mkdir $i
#sed -i '30d' config/setup.sh 
if [ $i == 5 ]
then
   sed -e "34 c\ sed -e \"206 a\\\  FILE *fp = NULL;\\\n  fp = fopen(\\\\\"test.log\\\\\", \\\\\"w+\\\\\");\\\n  fprintf(fp, \\\\\"ORBS:%d\\\\\",result);\\\n  fclose(fp);\" < orig/c/enc/encode.c > work/c/enc/encode.c" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 6 ]
then
   sed -e "34 c\ sed -e \"225 a\\\  FILE *fp = NULL;\\\n  fp = fopen(\\\\\"test.log\\\\\", \\\\\"w+\\\\\");\\\n  fprintf(fp, \\\\\"ORBS:%zu\\\\\",htsize);\\\n  fclose(fp);\" < orig/c/enc/encode.c > work/c/enc/encode.c" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 7 ]
then
   sed -e "34 c\ sed -e \"373 a\\\  FILE *fp = NULL;\\\n  fp = fopen(\\\\\"test.log\\\\\", \\\\\"w+\\\\\");\\\n  fprintf(fp, \\\\\"ORBS:%zu\\\\\",dummy);\\\n  fclose(fp);\" < orig/c/enc/encode.c > work/c/enc/encode.c" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 8 ]
then
   sed -e "34 c\ sed -e \"165 a\\\  FILE *fp = NULL;\\\n  fp = fopen(\\\\\"test.log\\\\\", \\\\\"w+\\\\\");\\\n  fprintf(fp, \\\\\"ORBS:%d\\\\\",n);\\\n  fclose(fp);\" < orig/c/dec/decode.c > work/c/dec/decode.c" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 9 ]
then
   sed -e "34 c\ sed -e \"190 a\\\  FILE *fp = NULL;\\\n  fp = fopen(\\\\\"test.log\\\\\", \\\\\"w+\\\\\");\\\n  fprintf(fp, \\\\\"ORBS:%d\\\\\",bits);\\\n  fclose(fp);\" < orig/c/dec/decode.c > work/c/dec/decode.c" config/setup.sh > config/setup.sh.tmp
   sudo mv config/setup.sh.tmp config/setup.sh
elif [ $i == 10 ]
then
   sed -e "34 c\ sed -e \"508 a\\\  FILE *fp = NULL;\\\n  fp = fopen(\\\\\"test.log\\\\\", \\\\\"w+\\\\\");\\\n  fprintf(fp, \\\\\"ORBS:%d\\\\\",i);\\\n  fclose(fp);\" < orig/c/dec/decode.c > work/c/dec/decode.c" config/setup.sh > config/setup.sh.tmp
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
