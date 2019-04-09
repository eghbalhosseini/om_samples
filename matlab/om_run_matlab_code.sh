#!/bin/sh

#  om_run_matlab_code.sh
#SBATCH --job-name=om_run_matlab_code
#SBATCH -t 6:00:00
#SBATCH --ntask=1
#SBATCH --array=1-50%10
#SBATCH --mem-per-cpu 10000
#SBATCH --exclude node017,node018
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ehoseini@mit.edu
#SBATCH --output=om_run_matlab_code_%j.out
#SBATCH --error=om_om_run_matlab_code_%j.err

module add mit/matlab/2018a
matlab -nodisplay -signelCompThread -r "addpath(genpath('/home/ehoseini/MyCodes/om_samples/')); \
a=func_matlab_code($SLURM_ARRAY_TASK_ID);\
end;\
quit;"
