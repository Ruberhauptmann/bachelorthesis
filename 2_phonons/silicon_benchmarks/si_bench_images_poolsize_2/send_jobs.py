import glob
import os
import subprocess
from jinja2 import Environment, FileSystemLoader
from distutils.dir_util import copy_tree
from shutil import rmtree

def main():
    number_k_points = 216
    max_number_procs = 200

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    input_template_scf = env.get_template('input.scf.jinja')
    input_template_ph = env.get_template('input.ph.jinja')
    input_template_ph_recover = env.get_template('input_recover.ph.jinja')
    input_template_q2r = env.get_template('input.q2r.jinja')
    input_template_md = env.get_template('input.md.jinja')
    job_template = env.get_template('silicon_ph_bench_nk.sh.jinja')

    poolsize = 2

    job_directory = '/fastscratch/tsievers/si_ph_benchmark_images/'
    rmtree(job_directory)
    os.makedirs(job_directory + '/tmp', exist_ok=True)
    os.makedirs(job_directory + '/frq', exist_ok=True)
    os.makedirs(job_directory + '/logs', exist_ok=True)
    copy_tree('pseudos', job_directory + '/pseudos')

    for run in range(2):
        os.makedirs(job_directory + '/frq/' + str(run), exist_ok=True)
        #for nimages in [2, 8, 24]:
        for nimages in [36, 72]:
            for n_procs in range(16, max_number_procs+1, 16):
                if (n_procs / nimages ) % poolsize == 0:
                    job_name = 'si_ph_bench_nimages_' + str(nimages) + '_n_procs_' + str(n_procs) + '_' + str(run)

                    out_directory = os.path.join(job_directory, 'output', str(run), str(nimages), str(job_name))

                    os.makedirs(out_directory, exist_ok=True)

                    for file in glob.glob(out_directory + '/*'):
                        os.remove(file)

                    prefix = job_name
                    fildyn = os.path.join(job_directory + 'tmp', job_name + ".dyn")
                    flfrc = os.path.join(job_directory + 'tmp', job_name + '.FC')
                    flvec = os.path.join(job_directory + 'tmp', job_name + '.modes')
                    flfrq = os.path.join(job_directory + 'frq', str(run), job_name + '.frq')

                    input_file_scf = input_template_scf.render(
                        prefix=prefix,
                        job_directory=job_directory
                    )

                    input_file_ph = input_template_ph.render(
                        prefix=prefix,
                        fildyn=fildyn
                    )

                    input_file_ph_recover = input_template_ph_recover.render(
                        prefix=prefix,
                        fildyn=fildyn
                    )

                    input_file_q2r = input_template_q2r.render(
                        fildyn=fildyn,
                        flfrc=flfrc
                    )

                    input_file_md = input_template_md.render(
                        flfrc=flfrc,
                        flvec=flvec,
                        flfrq=flfrq
                    )

                    job_file = job_template.render(
                        image_size=int(n_procs / nimages),
                        ni=nimages,
                        nk=int((n_procs / nimages) / poolsize),
                        n_procs=n_procs,
                        out_directory=out_directory,
                        job_directory=job_directory,
                        log_directory=job_directory + 'logs',
                        job_name=job_name
                    )

                    with open(job_directory + job_name + '.scf', 'w') as fh:
                        fh.write(input_file_scf)
                    with open(job_directory + job_name + '.ph', 'w') as fh:
                        fh.write(input_file_ph)
                    with open(job_directory + job_name + '_recover' + '.ph', 'w') as fh:
                        fh.write(input_file_ph_recover)
                    with open(job_directory + job_name + '.q2r', 'w') as fh:
                        fh.write(input_file_q2r)
                    with open(job_directory + job_name + '.md', 'w') as fh:
                        fh.write(input_file_md)
                    with open(job_directory + job_name + '.sh', 'w') as fh:
                        fh.write(job_file)

                    os.chdir(out_directory)

                    subprocess.call('qsub ../../../../' + job_name + '.sh', shell=True)

if __name__ == "__main__":
    main()
