import glob
import os
import subprocess
from jinja2 import Environment, FileSystemLoader
from distutils.dir_util import copy_tree
from shutil import rmtree

def main():
    number_k_points = 576
    max_number_procs = 200

    os.makedirs('in_files', exist_ok=True)
    os.makedirs('job_files', exist_ok=True)

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template_scf = env.get_template('input.scf.jinja')
    input_template_ph = env.get_template('input.ph.jinja')
    job_template = env.get_template('TaS2_ph_bench_nk.sh.jinja')

    for run in range(1):
        for poolsize in [2, 8]:
            for n_procs in range(32, max_number_procs+1, 32):
                log_path = os.getenv('HOME') + '/job_logs/TaS2/phonons/bench_nk_const_poolsize/' + str(run) + '/' + str(poolsize)
                os.makedirs(log_path, exist_ok=True)
                for file in glob.glob(log_path + '/*'):
                    os.remove(file)

                if n_procs % poolsize == 0:
                    job_name = 'TaS2_ph_bench_poolsize_' + str(poolsize) + '_n_procs_' + str(n_procs) + '_' + str(run)
                    prefix = '\'' + job_name +  '\''

                    input_file_scf = input_template_scf.render(job_name=job_name)
                    input_file_ph = input_template_ph.render(job_name=job_name)
                    job_file = job_template.render(nk=int(n_procs / poolsize),
                    n_procs=n_procs,
                    log_path=log_path,
                    job_name=job_name,
                    in_files_path="in_files")
                    with open('in_files/' + job_name + '.ph'  , 'w') as fh:
                        fh.write(input_file_ph)
                    with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                        fh.write(input_file_scf)
                    with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                        fh.write(job_file)

                    subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

        for poolsize in [18]:
            for n_procs in range(36, max_number_procs+1, 36):
                log_path = os.getenv('HOME') + '/job_logs/TaS2/phonons/bench_nk_const_poolsize/' + str(run) + '/' + str(poolsize)
                os.makedirs(log_path, exist_ok=True)
                for file in glob.glob(log_path + '/*'):
                    os.remove(file)

                if n_procs % poolsize == 0:
                    job_name = 'TaS2_ph_bench_poolsize_' + str(poolsize) + '_n_procs_' + str(n_procs) + '_' + str(run)
                    prefix = job_name

                    input_file_scf = input_template_scf.render(job_name=job_name)
                    input_file_ph = input_template_ph.render(job_name=job_name)
                    job_file = job_template.render(nk=int(n_procs / poolsize),
                    n_procs=n_procs,
                    log_path=log_path,
                    job_name=job_name,
                    in_files_path="in_files")
                    with open('in_files/' + job_name + '.ph'  , 'w') as fh:
                        fh.write(input_file_ph)
                    with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                        fh.write(input_file_scf)
                    with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                        fh.write(job_file)

                    subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()
