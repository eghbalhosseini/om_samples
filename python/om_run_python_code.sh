#!/bin/sh

#  om_run_python_code.sh
#SBATCH --job-name=om_run_python_code
#SBATCH -t 0:50:00
#SBATCH --ntask=1
#SBATCH --array=1-8%2
#SBATCH --mem-per-cpu 2000
#SBATCH --exclude node017,node018
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ehoseini@mit.edu
#SBATCH --output=om_run_python_code_%j.out
#SBATCH --error=om_om_run_python_code_%j.err

module add openmind/singularity
export SINGULARITY_CACHEDIR=/om/user/`whoami`/st/
singularity exec --nv -B /om:/om /om/user/`whoami`/simg_images/om_image_tensorflow1-12_gpu.simg /usr/bin/python3 ~/MyCodes/om_samples/python/run_python_code.py $SLURM_ARRAY_TASK_ID
