from cmath import log
import glob
import os
import subprocess
from jinja2 import Environment, FileSystemLoader

def main():
    max_number_procs = 40

    os.makedirs('in_files', exist_ok=True)
    os.makedirs('job_files', exist_ok=True)

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('TaS2_cdw_bench_nprocs.sh.jinja')

    for run in range(1, 10):
        log_path = os.getenv('HOME') + '/job_logs/TaS2/bench_nprocs_intel/' + str(run)
        os.makedirs(log_path, exist_ok=True)
        for file in glob.glob(log_path + '/*'):
            os.remove(file)

        #for n_procs in range(4, max_number_procs + 1, 4):
        for n_procs in range(8, 81, 8):
        #for n_procs in range(4, 17, 4):
            job_name = 'TaS2_bench_intel_n_procs_' + str(n_procs) + '_' + str(run)
            prefix = '\'' + job_name +  '\''

            input_file = input_template.render(prefix=prefix)
            job_file = job_template.render(n_procs=n_procs,
            log_path=log_path,
            job_name=job_name,
            in_files_path="in_files")
            with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                fh.write(input_file)
            with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                fh.write(job_file)

            subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()
