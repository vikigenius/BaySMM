#!/bin/bash
#SBATCH --account=def-ovechtom
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --gres=gpu:1
#SBATCH  --cpus-per-task=1
#SBATCH --mem=60G
#SBATCH --time=0:29:59

module load python/3.7
virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
pip install --no-index --upgrade pip

pip install --no-index -r requirements.txt

python src/run_baysmm.py extract data/mtx.flist exp1/s_1.00_rp_1_lw_1e+01_l1_1e-03_50_adam_batch_wise/model_T1000.h5 -xtr 1000 -nth 100 -nb 8
