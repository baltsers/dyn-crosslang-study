import os, time, threading
running = True
pidfile = '/tmp/pyrasite_%d' % os.getpid()
open(pidfile, 'w').close()
def cpu_bound():
    i = 0
    while running:
        i += 1
        print(i)
threading.Thread(target=cpu_bound).start()

while os.path.exists(pidfile):
    time.sleep(100)
running = False