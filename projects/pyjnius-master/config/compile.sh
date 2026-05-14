# Configure ORBS for this project.
source config/config.sh

cd work

# The actual compilation, here done via make.
sudo pip3 --disable-pip-version-check uninstall -y pyjnius 1> /dev/null 2>/dev/null
rm -rf classes
rm -rf test-classes
rm -rf __pycache__
rm -rf .pytest_cache
rm -rf build
rm -rf dist
rm -rf pyjnius.egg-info
#sudo python setup.py clean --all 2> compile.log 1> /dev/null #2>&1
sudo python3.8 setup.py install 2>> compile_err.log 1> compile.log #2>&1

#mk=`make`
#echo $mk 1> make_result.log 2> /dev/null
make 1> make_result.log 2> /dev/null 

# check successful compilation and create signature
#if [ -f "./build/lib.linux-x86_64-2.7/pyrasite/main.py" -z "$(LC_ALL="en_US" python ./pyrasite/main.py 1 hello.py)" ]; then 
if [ -f "./build/lib.linux-x86_64-3.8/jnius/env.py" ]; then 
   # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
	
    md5sum ./build/classes/org/jnius/NativeInvocationHandler.class ./build/lib.linux-x86_64-3.8/jnius/__init__.py ./build/lib.linux-x86_64-3.8/jnius/env.py ./build/lib.linux-x86_64-3.8/jnius/reflect.py ./build/lib.linux-x86_64-3.8/jnius/signatures.py ./build/lib.linux-x86_64-3.8/jnius/src/org/jnius/NativeInvocationHandler.java ./build/lib.linux-x86_64-3.8/jnius/jnius.cpython-38-x86_64-linux-gnu.so
	#echo Succ
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi


#ORBS have a problem that if first compile return FAIL, then it will record it and compared it with others
