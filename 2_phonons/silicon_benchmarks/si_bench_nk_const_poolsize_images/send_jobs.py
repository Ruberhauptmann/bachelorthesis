import glob
import os
import subprocess
from jinja2 import Environment, FileSystemLoader

def find_all_divisors(number, maximum):
    divisors = []

    for i in range(1, maximum+1):
        if number % i == 0:
            divisors.append(i)

    return divisors

def main():
    number_k_points = 216
    max_number_procs = 160

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template_scf = env.get_template('input.scf.jinja')
    input_template_ph = env.get_template('input.ph.jinja')
    job_template = env.get_template('silicon_ph_bench_nk.sh.jinja')

    poolsize_list = find_all_divisors(number_k_points, max_number_procs)
    print(poolsize_list)

    nimages = 2

    for run in range(1):
        #for poolsize in poolsize_list:
        for poolsize in [2, 8]:
        #for nk in [2]:
            #for n_procs in range(poolsize_list[-1], max_number_procs, poolsize_list[-1]):
            for n_procs in range(16, max_number_procs+1, 8):
                log_path = os.getenv('HOME') + '/job_logs/silicon/phonons/bench_nk_const_poolsize_images/' + str(poolsize)
                os.makedirs(log_path, exist_ok=True)
                for file in glob.glob(log_path + '/*'):
                    os.remove(file)

                #if n_procs % poolsize == 0 and n_procs % 5 == 0:
                if (n_procs / nimages ) % poolsize == 0:
                    job_name = 'si_ph_bench_poolsize_' + str(poolsize) + '_n_procs_' + str(n_procs) + '_' + str(run)
                    prefix = '\'' + job_name +  '\''

                    input_file_scf = input_template_scf.render(prefix=prefix)
                    input_file_ph = input_template_ph.render(prefix=prefix,
                    fildyn="\'/fastscratch/tsievers/QE_TMP_DIR/" + job_name + ".dyn\'")
                    job_file = job_template.render(ni=nimages,
                    nk_ph=int((n_procs / nimages) / poolsize),
                    nk_pw=int(n_procs / poolsize),
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
