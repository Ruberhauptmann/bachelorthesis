import os
import subprocess

files = os.listdir("job_files")

for file_name in files:
    subprocess.call("qsub job_files/" + file_name, shell=True)
