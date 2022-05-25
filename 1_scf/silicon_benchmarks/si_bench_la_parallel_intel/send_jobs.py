import glob
import os
from jinja2 import Environment, FileSystemLoader
import subprocess

def find_square_numbers(maximum):
    squares = []

    for i in range(2, maximum+1):
        if i**2 < maximum:
            squares.append(i**2)

    return squares

def main():
    max_number_procs = 40

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('silicon_bench_nd.sh.jinja')

    for nd in find_square_numbers(max_number_procs):
        log_path = os.getenv('HOME') + '/job_logs/silicon/bench_la_parallel_intel/nd_' + str(nd)
        os.makedirs(log_path, exist_ok=True)
        for file in glob.glob(log_path + '/*'):
            os.remove(file)

        for n_procs in range(2, max_number_procs + 1, 2):
            if n_procs >= nd:
                job_name = 'silicon_bench_nd_' + str(nd) + '_n_procs_' + str(n_procs)
                prefix = '\'' + job_name +  '\''

                input_file = input_template.render(prefix=prefix)
                job_file = job_template.render(nd=nd, n_procs=n_procs, log_path=log_path, job_name=job_name)
                with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                    fh.write(input_file)
                with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                    fh.write(job_file)

                subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('silicon_bench_nd_auto.sh.jinja')

    log_path = os.getenv('HOME') + '/job_logs/silicon/bench_la_parallel_intel/nd_auto'
    os.makedirs(log_path, exist_ok=True)
    for file in glob.glob(log_path + '/*'):
        os.remove(file)

    for n_procs in range(2, max_number_procs + 1, 2):
        job_name = 'silicon_bench_nd_auto_n_procs_' + str(n_procs)
        prefix = '\'' + job_name +  '\''

        input_file = input_template.render(prefix=prefix)
        job_file = job_template.render(nd=nd,
        n_procs=n_procs,
        log_path=log_path,
        job_name=job_name)
        with open('in_files/' + job_name + '.scf'  , 'w') as fh:
            fh.write(input_file)
        with open('job_files/' + job_name + '.sh'  , 'w') as fh:
            fh.write(job_file)

        subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()