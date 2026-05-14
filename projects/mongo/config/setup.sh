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

#sed -e '163 a\ printf("\\nORBS:%d\\n", diff);' < orig/bson/_cbsonmodule.c > work/bson/_cbsonmodule.c
#sed -e '189 a\ printf("\\nORBS:%d\\n", millis);' < orig/bson/_cbsonmodule.c > work/bson/_cbsonmodule.c
#sed -e '256 a\ printf("\\nORBS:%d\\n", seconds);' < orig/bson/time64.c > work/bson/time64.c

#sed -e '489 a\ printf("\\nORBS:%d\\n", length);' < orig/pymongo/_cmessagemodule.c > work/pymongo/_cmessagemodule.c

sed -e '48 s/$/ print("ORBS: " + delay);/' < orig/pymongo/daemon.py > work/pymongo/daemon.py

#if [ $? -eq 0 ]; then
#	echo insert Success
#else
#    echo insert Fail
#fi