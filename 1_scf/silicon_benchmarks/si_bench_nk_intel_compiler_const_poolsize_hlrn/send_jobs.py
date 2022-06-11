import glob
import os
from jinja2 import Environment, FileSystemLoader

def find_all_divisors(number, maximum):
    divisors = []

    for i in range(2, maximum+1):
        if number % i == 0:
            divisors.append(i)

    return divisors

def main():
    number_k_points = 4000
    max_number_procs = 80

    for file in glob.glob('in_files/*'):
        os.remove(file)

    for file in glob.glob('job_files/*'):
        os.remove(file)

    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)

    job_template = env.get_template('silicon_bench_nk_hlrn.sh.jinja')
    submit_template = env.get_template('submit_job.sh.jinja')

    poolsize_list = find_all_divisors(number_k_points, max_number_procs)
    print(poolsize_list)

    jobs = []
    out_directories = []

    for run in range(1):
        out_directory = "out_file_silicon/" + str(run) + "/singlecore"
        out_directories.append(out_directory)
        job = "mpirun -np 1 pw.x -nk 1 < silicon.scf > " + out_directory + "/silicon_bench_singlecore_" + str(run) + ".log"
        jobs.append(job)
        for poolsize in [2, 8, 16]:
            out_directory = "out_files_silicon/" + str(run) + "/" + str(poolsize)
            out_directories.append(out_directory)
            for n_procs in range(8, 81, 8):
                if n_procs % poolsize == 0.:
                    nk = str(int(n_procs / poolsize))
                    job = "mpirun -np " + str(n_procs) + " pw.x -nk " + nk + " -nd 1 < silicon.scf > " + out_directory + "/" + "silicon_bench_nk_" + nk + "_n_procs_" + str(n_procs) + "_" + str(run) + ".log"

                    jobs.append(job)

    job_file = job_template.render(jobs=jobs)
    submit_file = submit_template.render(directories=out_directories)
    with open("silicon_nk_benchmark_hlrn.sh" , 'w') as fh:
        fh.write(job_file)
    with open("submit_job.sh" , 'w') as fh:
        fh.write(submit_file)

if __name__ == "__main__":
    main()
