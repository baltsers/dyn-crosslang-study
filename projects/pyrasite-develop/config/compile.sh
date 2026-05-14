# Configure ORBS for this project.
source config/config.sh

cd work

# The actual compilation, here done via make.
#sudo pip uninstall -y pyrasite
rm -rf build
rm -rf dist
rm -rf pyrasite.egg-info
#sudo python setup.py clean --all 2> compile.log 1> /dev/null #2>&1
#sudo python setup.py install 2>> compile.log 1> /dev/null #2>&1
python setup.py install 2>> compile.log 1> compile_out.log #/dev/null #2>&1

# check successful compilation and create signature
#if [ -f "./build/lib.linux-x86_64-2.7/pyrasite/main.py" -z "$(LC_ALL="en_US" python ./pyrasite/main.py 1 hello.py)" ]; then 
#if [ -f "./build/lib.linux-x86_64-2.7/pyrasite/main.py" ]; then  
if [ -f "./build/lib/pyrasite/main.py" ]; then       #this for win
   # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
	
    md5sum ./build/lib/pyrasite/main.py ./build/lib/pyrasite/injector.py ./build/lib/pyrasite/injector.py ./build/lib/pyrasite/ipc.py ./build/lib/pyrasite/__init__.py ./build/lib/pyrasite/inspector.py ./build/lib/pyrasite/reverse.py ./build/lib/pyrasite/payloads/dump_memory.py ./build/lib/pyrasite/payloads/dump_modules.py ./build/lib/pyrasite/payloads/dump_stacks.py ./build/lib/pyrasite/payloads/force_garbage_collection.py ./build/lib/pyrasite/payloads/helloworld.py ./build/lib/pyrasite/payloads/reverse_python_shell.py ./build/lib/pyrasite/payloads/reverse_shell.py ./build/lib/pyrasite/payloads/start_callgraph.py ./build/lib/pyrasite/payloads/stop_callgraph.py ./build/lib/pyrasite/tests/context_manager_case.py ./build/lib/pyrasite/tests/test_cli.py ./build/lib/pyrasite/tests/test_code_injection.py ./build/lib/pyrasite/tests/test_ipc.py ./build/lib/pyrasite/tests/utils.py ./build/lib/pyrasite/tools/memory_viewer.py ./build/lib/pyrasite/tools/shell.py ./pyrasite/win/inject_python.cpp #./build/lib/pyrasite/win/inject_python_32.exe ./build/lib/pyrasite/win/inject_python_64.exe
	#echo Succ
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi


#ORBS have a problem that if first compile return FAIL, then it will record it and compared it with others
