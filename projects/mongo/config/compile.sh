# Configure ORBS for this project.
source config/config.sh

cd work

# The actual compilation, here done via make.
#make > compile.log 2>&1
#gcc $CFLAGS -o time64 time64.c 2> compile.log
sudo python setup.py clean --all 2> compile.log 1> /dev/null #2>&1
sudo python setup.py install 2>> compile.log 1> /dev/null #2>&1

# check successful compilation and create signature
if [ -f "./build/lib.linux-x86_64-2.7/pymongo/_cmessage.so" ]; then
#if [ $? -eq 0 ]; then
    # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
    if [ -f "./build/temp.linux-x86_64-2.7/bson/_cbsonmodule.o" ]; then
		md5sum ./build/lib.linux-x86_64-2.7/pymongo/_cmessage.so ./build/temp.linux-x86_64-2.7/pymongo/_cmessagemodule.o
	else
		echo FAIL
	fi
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi

