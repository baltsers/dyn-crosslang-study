# Configure ORBS for this project.
source config/config.sh

cd work

# The actual compilation, here done via make.
#sudo pip3 --disable-pip-version-check uninstall -y pyjnius 1> /dev/null 2>/dev/null
rm -rf target

#sudo python setup.py clean --all 2> compile.log 1> /dev/null #2>&1
mvn package 1> mvn_result.log 2> /dev/null

#mk=`make`
#echo $mk 1> make_result.log 2> /dev/null
#make 1> make_result.log 2> /dev/null 

# check successful compilation and create signature
#if [ -f "./build/lib.linux-x86_64-2.7/pyrasite/main.py" -z "$(LC_ALL="en_US" python ./pyrasite/main.py 1 hello.py)" ]; then 
if [ -f "./target/pysonar-2.1.2.jar" ]; then 
   # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
	
    md5sum  ./target/classes/org/yinwang/pysonar/*.class ./target/classes/org/yinwang/pysonar/ast/*.class ./target/classes/org/yinwang/pysonar/demos/*.class ./target/classes/org/yinwang/pysonar/hash/*.class ./target/classes/org/yinwang/pysonar/models/*.py ./target/classes/org/yinwang/pysonar/python/*.py ./target/classes/org/yinwang/pysonar/types/*.class ./target/classes/org/yinwang/pysonar/visitor/*.class
	#echo Succ
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi


#ORBS have a problem that if first compile return FAIL, then it will record it and compared it with others
