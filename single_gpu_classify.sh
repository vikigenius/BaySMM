#!/bin/bash
#SBATCH --account=rrg-ovechtom
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --gres=gpu:1
#SBATCH  --cpus-per-task=3
#SBATCH --mem=120G
#SBATCH --time=2:59:59

module load python/3.7
virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
pip install --no-index --upgrade pip

pip install --no-index -r requirements.txt

python src/train_and_clf_cv.py exp1/s_1.00_rp_1_lw_1e+01_l1_1e-03_50_adam_batch_wise/ivecs/train_model_T1000_e1000.h5 data/train.labels glcu
