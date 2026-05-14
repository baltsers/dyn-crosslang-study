








# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the







import os
import subprocess
import platform

def inject(pid, filename, verbose=False, gdb_prefix=''):

    filename = os.path.abspath(filename)
    gdb_cmds = [
        'PyGILState_Ensure()',
        'PyRun_SimpleString("'
            'import sys; sys.path.insert(0, \\"%s\\"); '
            'sys.path.insert(0, \\"%s\\"); '
            'exec(open(\\"%s\\").read())")' %
                (os.path.dirname(filename),
                os.path.abspath(os.path.join(os.path.dirname(__file__), '..')),
                filename),

        ]
    p = subprocess.Popen('%sgdb -p %d -batch %s' % (gdb_prefix, pid,
        ' '.join(["-eval-command='call %s'" % cmd for cmd in gdb_cmds])),
        shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    print 'ORBS:',filename
    if verbose:

        print(err)


    def inject_win(pid, filename, verbose=False, gdb_prefix=''):
        if gdb_prefix == '':
            gdb_prefix = os.path.join(os.path.dirname(__file__), 'win') + os.sep
        filename = os.path.abspath(filename)



        if p.wait() == 25:

            out, err = p.communicate()





