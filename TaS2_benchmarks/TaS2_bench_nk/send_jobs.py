from cmath import log
import glob
import os
import subprocess
from jinja2 import Environment, FileSystemLoader

def find_all_divisors(number, maximum):
    divisors = []

    for i in range(2, maximum+1):
        if number % i == 0:
            divisors.append(i)

    return divisors

def main():
    number_k_points = 19
    max_number_procs = 40

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('TaS2_12x12_bench_nk.sh.jinja')

    for nk in find_all_divisors(number_k_points, max_number_procs):
        log_path = os.getenv('HOME') + '/job_logs/silicon/bench_nk/nk_' + str(nk)
        os.makedirs(log_path, exist_ok=True)
        for file in glob.glob(log_path + '/*'):
            os.remove(file)

        for n_procs in range(1, max_number_procs + 1):
            if n_procs % nk == 0:
                job_name = 'silicon_bench_nk_' + str(nk) + '_n_procs_' + str(n_procs)
                prefix = '\'' + job_name +  '\''

                input_file = input_template.render(prefix=prefix)
                job_file = job_template.render(nk=nk, n_procs=n_procs, log_path=log_path, job_name=job_name)
                with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                    fh.write(input_file)
                with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                    fh.write(job_file)

                #subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()