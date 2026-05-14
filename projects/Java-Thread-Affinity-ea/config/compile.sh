# Configure ORBS for this project.
source config/config.sh

cd /usr/lib/
sudo rm -f libCEInternals.so
cd /mnt/c/Users/yhryy/Desktop/TryRealProj/projects/Java-Thread-Affinity-ea/work/

mvn clean> /dev/null
#cd affinity
#sudo rm -rf target
#cd ..
sudo rm -f mvn_compile.log


sudo mvn package 1> mvn_compile.log 2> /dev/null

#mk=`make`
#echo $mk 1> make_result.log 2> /dev/null
#make 1> make_result.log 2> /dev/null 

# check successful compilation and create signature
#if [ -f "./build/lib.linux-x86_64-2.7/pyrasite/main.py" -z "$(LC_ALL="en_US" python ./pyrasite/main.py 1 hello.py)" ]; then 
if [ -f "./affinity/target/affinity-3.21ea2-SNAPSHOT.jar"  -a $(grep -c "BUILD FAILURE" mvn_compile.log) -eq 0 ]; then #-f "./affinity/target/affinity-3.21ea2-SNAPSHOT.jar"  -a  
   # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
	
    md5sum  ./affinity/target/classes/libCEInternals.so  ./affinity/target/classes/net/openhft/affinity/*.class ./affinity/target/classes/net/openhft/affinity/impl/*.class ./affinity/target/classes/net/openhft/affinity/lockchecker/*.class ./affinity/target/classes/net/openhft/affinity/main/*.class ./affinity/target/classes/net/openhft/ticker/*.class ./affinity/target/classes/net/openhft/ticker/impl/*.class ./affinity/target/classes/software/chronicle/enterprise/internals/impl/NativeAffinity.class 
	#echo Succ
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi


#ORBS have a problem that if first compile return FAIL, then it will record it and compared it with others
