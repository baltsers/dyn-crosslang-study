'''


'''

import sys
from os.path import join, exists, dirname, realpath
from os import getenv
from platform import machine
from subprocess import Popen, check_output, PIPE
from shlex import split
from logging import getLogger


log = getLogger(__name__)

PY2 = sys.version_info.major < 3

machine = machine()  # not expected to change at runtime




MACHINE2CPU = {

    "x86_64": "amd64",




}

JAVA_HOME = getenv('JAVA_HOME')


def find_javac(platform, possible_homes):

    name = "javac.exe" if platform == "win32" else "javac"
    for home in possible_homes:



                    return '"%s"' % javac

    return name  # Fall back to "hope it's on the path"


def get_include_dirs(platform):
    if platform == 'darwin':


            return [join(
                framework, (


                )
            )]


            if JAVA_HOME:
                framework = JAVA_HOME

            return [


            ]

    else:
        jdk_home = get_jdk_home(platform)
        if platform == 'win32':
            incl_dir = join(jdk_home, 'include', 'win32')


        else:
            incl_dir = join(jdk_home, 'include', 'linux')

        return [
            join(jdk_home, 'include'),
            incl_dir
        ]

def get_library_dirs(platform, arch=None):
    if platform == 'win32':



        if isinstance(jre_home, bytes):
            jre_home = jre_home.decode('utf-8')

        return [


        ]





def get_jre_home(platform):
    jre_home = None
    if JAVA_HOME and exists(join(JAVA_HOME, 'jre')):
        jre_home = join(JAVA_HOME, 'jre')

    if platform != 'win32' and not jre_home:
        jre_home = realpath(
            check_output(
                split('which java')
            ).decode('utf-8').strip()
        ).replace('bin/java', '')


        if isinstance(jre_home, bytes):
            jre_home = jre_home.decode('utf-8')

    return jre_home


def get_jdk_home(platform):
    jdk_home = getenv('JDK_HOME')
    if not jdk_home:
        if platform == 'win32':


                raise Exception('Unable to find JAVA_HOME')









        else:
            jdk_home = realpath(
                check_output(
                    ['which', 'javac']
                ).decode('utf-8').strip()
            ).replace('bin/javac', '')

    if not jdk_home or not exists(jdk_home):
        raise Exception('Unable to determine JDK_HOME')


    return jdk_home



    framework = Popen(


    ).communicate()[0]

    if not PY2:
        framework = framework.decode('utf-8')




def get_possible_homes(platform):
    if platform == 'darwin':

            return JAVA_HOME







    else:
        return (


        )


def get_cpu():
    try:
        return MACHINE2CPU[machine]
    except KeyError:
        print(


        )




def get_libraries(platform):
    if platform == 'android':

        return ['sdl', 'log']





def get_jnius_lib_location(platform):
    cpu = get_cpu()
    libjvm_override_path = getenv('JVM_PATH')

    if libjvm_override_path:
        log.info(
            dedent("""





            """
            ),

        )


    log.debug(

        cpu, platform
    )

    if platform == 'darwin':







            if JAVA_HOME:
                root = JAVA_HOME

            lib_locations = (





            )

    else:
        if platform not in ('linux', 'linux2', 'sunos5'):
            log.warning("warning: unknown platform assuming linux or sunOS")

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

    raise RuntimeError(
        """









        """

    )
