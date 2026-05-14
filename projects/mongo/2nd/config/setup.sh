# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project
#sed -e '131 a\
#printf("\\nORBS:%d\\n", buffer->position);' < orig/buffer.c > work/buffer.c

#sed -e '256 a\
#printf("\\nORBS:%d\\n", seconds);' < orig/bson/time64.c > work/bson/time64.c

sed -e '256 a\ printf("\\nORBS:%d\\n", seconds);' < orig/bson/time64.c > work/bson/time64.c

#sed -e '163 a\ printf("\\nORBS:%d\\n", diff);' < orig/bson/_cbsonmodule.c > work/bson/_cbsonmodule.c

if [ $? -eq 0 ]; then
	echo insert Success
else
    echo insert Fail
fi