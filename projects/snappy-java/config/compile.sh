# Configure ORBS for this project.
source config/config.sh

cd work

make clean 1> /dev/null 2> /dev/null

sudo rm -f make_compile.log 1> /dev/null 2> /dev/null


make 1> make_compile.log 2> /dev/null

#mk=`make`
#echo $mk 1> make_result.log 2> /dev/null
#make 1> make_result.log 2> /dev/null 

# check successful compilation and create signature
#if [ -f "./build/lib.linux-x86_64-2.7/pyrasite/main.py" -z "$(LC_ALL="en_US" python ./pyrasite/main.py 1 hello.py)" ]; then 
if [  -f "./target/snappy-java-1.1.8.5-SNAPSHOT.jar" ]; then #-f "./affinity/target/affinity-3.21ea2-SNAPSHOT.jar"  -a  
   # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
	
    md5sum  ./target/snappy-1.1.8-Linux-x86_64/*.o ./target/snappy-1.1.8-Linux-x86_64/*.so ./target/classes/org/xerial/snappy/*.class ./target/classes/org/xerial/snappy/buffer/*.class ./target/classes/org/xerial/snappy/native/FreeBSD/x86_64/*.so ./target/classes/org/xerial/snappy/native/Linux/aarch64/*.so ./target/classes/org/xerial/snappy/native/Linux/android-arm/*.so ./target/classes/org/xerial/snappy/native/Linux/arm/*.so  ./target/classes/org/xerial/snappy/native/Linux/armv7/*.so ./target/classes/org/xerial/snappy/native/Linux/ppc/*.so ./target/classes/org/xerial/snappy/native/Linux/ppc64/*.so ./target/classes/org/xerial/snappy/native/Linux/ppc64le/*.so ./target/classes/org/xerial/snappy/native/Linux/s390x/*.so ./target/classes/org/xerial/snappy/native/Linux/x86/*.so ./target/classes/org/xerial/snappy/native/Linux/x86_64/*.so ./target/classes/org/xerial/snappy/native/Linux/armv6/*.so ./target/classes/org/xerial/snappy/pool/*.class ./target/classes/org/xerial/snappy/pure/*.class ./target/jni-classes/org/xerial/snappy/*.class
	#echo Succ
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi


#ORBS have a problem that if first compile return FAIL, then it will record it and compared it with others
