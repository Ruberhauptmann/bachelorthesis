import os
import subprocess

files = os.listdir("jobs_wait")

for file_name in files:
    subprocess.call("qsub jobs_wait/" + file_name, shell=True)
