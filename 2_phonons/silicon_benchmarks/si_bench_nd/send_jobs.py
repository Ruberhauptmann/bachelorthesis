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

    input_template_scf = env.get_template('input.scf.jinja')
    input_template_ph = env.get_template('input.ph.jinja')
    job_template = env.get_template('silicon_ph_bench_nd.sh.jinja')

    #for nd in find_square_numbers(max_number_procs):
    for run in range(1):
        #for nd in [1, 4, 9, 16]:
        for nd in [1]:
            log_path = os.getenv('HOME') + '/job_logs/silicon/phonons/bench_la_parallel_intel/' + str(run) + '/nd_' + str(nd)
            os.makedirs(log_path, exist_ok=True)
            for file in glob.glob(log_path + '/*'):
                os.remove(file)

            for n_procs in range(4, max_number_procs + 1, 4):
                if n_procs >= nd:
                    job_name = 'silicon_ph_bench_nd_' + str(nd) + '_n_procs_' + str(n_procs) + '_' + str(run)
                    prefix = '\'' + job_name +  '\''

                    input_file_scf = input_template_scf.render(prefix=prefix)
                    input_file_ph = input_template_ph.render(prefix=prefix,
                    fildyn="\'/fastscratch/tsievers/QE_TMP_DIR/" + job_name + ".dyn\'")
                    job_file = job_template.render(nd=nd,
                    n_procs=n_procs,
                    log_path=log_path,
                    job_name=job_name,
                    in_files_path="in_files")
                    with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                        fh.write(input_file_scf)
                    with open('in_files/' + job_name + '.ph'  , 'w') as fh:
                        fh.write(input_file_ph)
                    with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                        fh.write(job_file)

                    subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

    input_template = env.get_template('input.scf.jinja')
    job_template = env.get_template('silicon_ph_bench_nd_auto.sh.jinja')

    for run in range(1):
        log_path = os.getenv('HOME') + '/job_logs/silicon/phonons/bench_la_parallel_intel/' + str(run) + '/nd_auto'
        os.makedirs(log_path, exist_ok=True)
        for file in glob.glob(log_path + '/*'):
            os.remove(file)

        for n_procs in range(4, max_number_procs + 1, 4):
            job_name = 'silicon_ph_bench_nd_auto_n_procs_' + str(n_procs) + '_' + str(run)
            prefix = '\'' + job_name +  '\''

            input_file_scf = input_template_scf.render(prefix=prefix)
            input_file_ph = input_template_ph.render(prefix=prefix,
            fildyn="\'/fastscratch/tsievers/QE_TMP_DIR/" + job_name + ".dyn\'")
            job_file = job_template.render(n_procs=n_procs,
            log_path=log_path,
            job_name=job_name,
            in_files_path="in_files")
            with open('in_files/' + job_name + '.scf'  , 'w') as fh:
                fh.write(input_file_scf)
            with open('in_files/' + job_name + '.ph'  , 'w') as fh:
                fh.write(input_file_ph)
            with open('job_files/' + job_name + '.sh'  , 'w') as fh:
                fh.write(job_file)

            #subprocess.call('qsub job_files/' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()
