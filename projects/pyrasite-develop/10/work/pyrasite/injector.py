
















import os
import subprocess
import platform

def inject(pid, filename, verbose=False, gdb_prefix=''):


    gdb_cmds = [





                (os.path.dirname(filename),

                filename),

        ]
    p = subprocess.Popen('%sgdb -p %d -batch %s' % (gdb_prefix, pid,
        ' '.join(["-eval-command='call %s'" % cmd for cmd in gdb_cmds])),
        shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    if verbose:

        print(err)

if platform.system() == 'Windows':
    def inject_win(pid, filename, verbose=False, gdb_prefix=''):
        if gdb_prefix == '':
            gdb_prefix = os.path.join(os.path.dirname(__file__), 'win') + os.sep

        code = 'import sys; sys.path.insert(0, \\"%s\\"); sys.path.insert(0, \\"%s\\"); exec(open(\\"%s\\").read())' % (os.path.dirname(filename).replace('\\', '/'), os.path.abspath(os.path.join(os.path.dirname(__file__), '..')).replace('\\', '/'), filename.replace('\\', '/'))
        p = subprocess.Popen('%sinject_python_32.exe %d \"%s\"' % (gdb_prefix, pid, code), shell = True, stdout = subprocess.PIPE, stderr = subprocess.PIPE)

        if p.wait() == 25:
            p = subprocess.Popen('%sinject_python_64.exe %d \"%s\"' % (gdb_prefix, pid, code), shell = True, stdout = subprocess.PIPE, stderr = subprocess.PIPE)
            out, err = p.communicate()

            print(out)


    inject = inject_win