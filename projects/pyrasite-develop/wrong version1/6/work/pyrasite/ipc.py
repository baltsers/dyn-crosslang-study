















"""


"""















class PyrasiteIPC(object):
    """Pyrasite Inter-Python Communication.






















    """






    def __init__(self, pid, reverse='ReversePythonConnection', timeout=5):


















        if not getattr(self, '_title', None):

                p = subprocess.Popen('tasklist /v /fi "pid eq %d" /nh /fo csv' % self.pid,
                                    stdout=subprocess.PIPE, shell=True)

                if tmp[-1] == '"N/A"':
                    self._title = tmp[0][1:-1]



                p = subprocess.Popen('ps --no-heading -o cmd= -p %d' % self.pid,
                                    stdout=subprocess.PIPE, shell=True)




        """


        """






        for res in socket.getaddrinfo('localhost', None, socket.AF_UNSPEC,
                                      socket.SOCK_STREAM, 0, 0):

            try:

                try:

                    self.server_sock.listen(1)
                except socket.error:


                    continue
            except socket.error:

                continue



            raise Exception('pyrasite was unable to setup a ' +
                            'local server socket')











            if line.startswith('#'):
                continue




























        """

        """































     print 'ORBS:',data













