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

    missing_runs = [[0, 2, 200],
    [0, 8, 104],
    [0, 8, 200],
    [0, 18, 18],
    [1, 2, 8],
    [1, 2, 200],
    [1, 8, 104],
    [1, 8, 200],
    [1, 18, 18],
    [3, 2, 8],
    [3, 2, 88],
    [3, 8, 88],
    [3, 18, 18],
    [3, 18, 54],
    [3, 18, 72],
    [3, 18, 90],
    [3, 18, 108]]

    for run, poolsize, n_procs in missing_runs:
        log_path = os.getenv('HOME') + '/job_logs/TaS2/bench_nk_intel_compiler_const_poolsize/' + str(run) + '/' + str(poolsize)
        os.makedirs(log_path, exist_ok=True)
        #for file in glob.glob(log_path + '/*'):
        #    os.remove(file)

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

    """
    for run in [4, 5]:
        for poolsize in [2, 8]:
            #for n_procs in range(8, max_number_procs+1, 16):
            for n_procs in [88, 104]:
                log_path = os.getenv('HOME') + '/job_logs/TaS2/bench_nk_intel_compiler_const_poolsize/' + str(run) + '/' + str(poolsize)
                os.makedirs(log_path, exist_ok=True)
                #for file in glob.glob(log_path + '/*'):
                #    os.remove(file)

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

        for poolsize in [18]:
            #for n_procs in range(18, max_number_procs+1, 18):
            for n_procs in [18, 54, 72, 90, 108]:
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
    """

if __name__ == "__main__":
    main()
