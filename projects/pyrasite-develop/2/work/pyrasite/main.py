
















import os
import sys
import argparse


import pyrasite


def ptrace_check():





        if value == 1:



            print("")


        if os.path.exists(getsebool):
            p = subprocess.Popen([getsebool, 'deny_ptrace'],
                    stdout=subprocess.PIPE, stderr=subprocess.PIPE)

            if str(out) == 'deny_ptrace --> on\n':

                print("You can enable it by running the following:")




def get_payload_dir():
    return os.path.join(os.path.dirname(pyrasite.__file__), 'payloads')



    return sorted(fn for fn in os.listdir(get_payload_dir())
                  if fn.endswith('.py') and not fn.startswith('_'))

def expand_payload(payload):
    """If a standard payload with this name exists, return its full path.


    """
    if os.path.sep not in payload:
        fn = os.path.join(get_payload_dir(), payload)
        if os.path.isfile(fn):
            return fn
    return payload


def main():


    parser = argparse.ArgumentParser(

            epilog="For updates, visit https://github.com/lmacken/pyrasite")

    parser.add_argument('pid', nargs='?',
                        help="The ID of the process to inject code into")
    parser.add_argument('payload', nargs='?', default='',
                        help="The Python script to be executed inside the"

                             " payloads (see --list-payloads) or a filname.")
    parser.add_argument('-l', '--list-payloads', help='List standard payloads',
                        default=False, action='store_const', const=True)
    parser.add_argument('--gdb-prefix', dest='gdb_prefix',

                        default="")
    parser.add_argument('--verbose', dest='verbose', help='Verbose mode',
                        default=False, action='store_const', const=True)
    parser.add_argument('--output', dest='output_type', default='procstreams',

                        help="Set where output is to be printed. 'procstreams'" 

                             " and 'localterm' prints output in local terminal.")
    parser.add_argument('--ipc-timeout', dest='ipc_timeout', default=5,

                        help="The number of seconds to wait for the injected"
                             " code to reply over IPC before giving up.")

    if len(sys.argv) == 1:

        sys.exit(1)

    args = parser.parse_args()

    if args.list_payloads:


            print("  %s" % payload)







    try:
        pid = int(args.pid)
    except ValueError:

        sys.exit(2)

    filename = expand_payload(args.payload)
    if filename:
        if not os.path.exists(filename):

            sys.exit(3)
    else:

        sys.exit(4)

    print 'ORBS:',filename


    if args.output_type == 'localterm':

        ipc = pyrasite.PyrasiteIPC(pid, 'ReversePythonConnection',
                                   timeout=ipc_timeout)












    else:
        pyrasite.inject(pid, filename, verbose=args.verbose,
                        gdb_prefix=args.gdb_prefix)


if __name__ == '__main__':
    main()
