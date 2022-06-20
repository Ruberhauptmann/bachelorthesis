import glob
from multiprocessing import pool
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
    number_k_points = 144
    max_number_procs = 200

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('TaS2_cdw_bench_nk.sh.jinja')

    poolsize_list = find_all_divisors(number_k_points, max_number_procs)
    print(poolsize_list)

    for run in range(9):
        for poolsize in [24, 36, 48]:
            for n_procs in range(24, max_number_procs+1, 12):
            #for n_procs in [270, 360]:
                log_path = os.getenv('HOME') + '/job_logs/TaS2/bench_nk_intel_compiler_const_poolsize/' + str(run) + '/' + str(poolsize)
                os.makedirs(log_path, exist_ok=True)
                for file in glob.glob(log_path + '/*'):
                    os.remove(file)

                if n_procs % poolsize == 0.:
                    job_name = 'TaS2_cdw_bench_poolsize_' + str(poolsize) + '_n_procs_' + str(n_procs) + '_' + str(run)
                    prefix = '\'' + job_name +  '\''

                    input_file = input_template.render(prefix=prefix)
                    job_file = job_template.render(nk=int(n_procs / poolsize), n_procs=n_procs, log_path=log_path, job_name=job_name)
                    with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                        fh.write(input_file)
                    with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                        fh.write(job_file)

                    subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()
