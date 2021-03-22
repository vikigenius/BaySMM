#!/bin/bash
#SBATCH --account=def-ovechtom
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --gres=gpu:1
#SBATCH  --cpus-per-task=3
#SBATCH --mem=120G
#SBATCH --time=24:00:00

module load python/3.7
virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
pip install --no-index --upgrade pip

pip install --no-index -r requirements.txt

python src/run_baysmm.py train data/train.mtx data/vocab exp1/ -K 50 -trn 1000 -lw 1e+01 -var_p 1e+01 -lt 1e-03 -nb 1000 --batchwise
