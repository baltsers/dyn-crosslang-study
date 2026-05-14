import subprocess

r = subprocess.call(["bash","config/execute.sh","ORBS","sanity"], shell=True)

#print r