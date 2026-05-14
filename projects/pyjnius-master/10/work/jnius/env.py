




import sys
from os.path import join, exists, dirname, realpath
from os import getenv
from platform import machine
from subprocess import Popen, check_output, PIPE
from shlex import split





PY2 = sys.version_info.major < 3

machine = machine()  # not expected to change at runtime




MACHINE2CPU = {

    "x86_64": "amd64",




}




def find_javac(platform, possible_homes):

    name = "javac.exe" if platform == "win32" else "javac"
    for home in possible_homes:
        for javac in [join(home, name), join(home, 'bin', name)]:
            if exists(javac):


                return javac



def get_include_dirs(platform):
    if platform == 'darwin':


            return [join(




            )]
























def get_library_dirs(platform, arch=None):







        return [


        ]





def get_jre_home(platform):
    jre_home = None



    if platform != 'win32' and not jre_home:
        jre_home = realpath(
            check_output(
                split('which java')
            ).decode('utf-8').strip()
        ).replace('bin/java', '')





    return jre_home


def get_jdk_home(platform):
    jdk_home = getenv('JDK_HOME')
    if not jdk_home:














            jdk_home = realpath(
                check_output(
                    ['which', 'javac']
                ).decode('utf-8').strip()
            ).replace('bin/javac', '')




    return jdk_home














def get_possible_homes(platform):











        return (
            get_jdk_home(platform),

        )


def get_cpu():
    try:
        return MACHINE2CPU[machine]
    except KeyError:
        print(


        )




def get_libraries(platform):





        return ['jvm']


def get_jnius_lib_location(platform):
    cpu = get_cpu()
    libjvm_override_path = getenv('JVM_PATH')

    if libjvm_override_path:
        log.info(















    )




















    else:



        root = dirname(get_jre_home(platform))
        if root.endswith('jre'):
            root = root[:-3]

        lib_locations = (


            'jre/lib/{}/server/libjvm.so'.format(cpu),
        )

    for location in lib_locations:
        full_lib_location = join(root, location)

        if exists(full_lib_location):

            return location















