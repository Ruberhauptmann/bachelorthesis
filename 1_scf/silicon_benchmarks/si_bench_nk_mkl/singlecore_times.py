import subprocess
import os
import glob
from jinja2 import Environment, FileSystemLoader

if __name__ == "__main__":
    os.makedirs('in_files_singlecore', exist_ok=True)
    os.makedirs('job_files_singlecore', exist_ok=True)

    for file in glob.glob('in_files_singlecore/*'):
        os.remove(file)

    for file in glob.glob('job_files_singlecore/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('silicon_bench_nk.sh.jinja')

    n_procs = 1

    for i in range(10):
        job_name = 'silicon_bench_nk_singlecore_' + str(i)
        prefix = '\'' + job_name +  '\''

        log_path = os.getenv('HOME') + '/job_logs/silicon/bench_nk_mkl/singlecore/' + str(i)
        os.makedirs(log_path, exist_ok=True)

        for file in glob.glob(log_path + '/*'):
            os.remove(file)

        input_file = input_template.render(prefix=prefix)
        job_file = job_template.render(nk=1, n_procs=n_procs, log_path=log_path, job_name=job_name, in_files_path="in_files_singlecore")
        with open('in_files_singlecore/' + job_name + '.scf'  , 'w') as fh:
            fh.write(input_file)
        with open('job_files_singlecore/' + job_name + '.sh'  , 'w') as fh:
            fh.write(job_file)

        subprocess.call('qsub job_files_singlecore/' + job_name + '.sh', shell=True)
