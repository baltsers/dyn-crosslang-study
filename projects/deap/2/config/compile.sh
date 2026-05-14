# Configure ORBS for this project.
source config/config.sh

cd work

# The actual compilation, here done via make.
sudo python setup.py clean --all 2> compile.log 1> /dev/null #2>&1
sudo python setup.py install 2>> compile.log 1> /dev/null #2>&1

# check successful compilation and create signature
if [-f "./build/lib.linux-x86_64-2.7/deap/tools/_hypervolume/hv.so" -z "$(LC_ALL="en_US" python ./deap/gp.py)" ]; then #]; then #
    # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
    md5sum ./build/lib.linux-x86_64-2.7/deap/tools/_hypervolume/hv.so
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi

