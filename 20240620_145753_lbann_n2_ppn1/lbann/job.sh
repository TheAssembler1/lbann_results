#!/bin/bash
#SBATCH --account=m2621
#SBATCH --qos=debug
#SBATCH --time=00:30:00
#SBATCH --nodes=2
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --constraint=cpu
#SBATCH --output=/pscratch/sd/n/nlewi26/lbann/%x-%j.out
#SBATCH --error=/pscratch/sd/n/nlewi26/lbann/%x-%j.err
#SBATCH --chdir=/pscratch/sd/n/nlewi26

YEAR=$(date +%Y)
MONTH=$(date +%m)  
MONTH=${MONTH#0} 
DAY=$(date +%d)   
DAY=${DAY#0}       

# Print current date components for verification
echo "YEAR: ${YEAR}, MONTH: ${MONTH}, DAY: ${DAY}"
mkdir -p "$/pscratch/sd/n/nlewi26/darshan-logs/${YEAR}/${MONTH}/${DAY}" || true
echo "Created directory: ${YEAR}/${MONTH}/${DAY}"

module use /global/u1/j/jeanbez/nersc-darshan-modules-test/new
module load darshan cray-mpich cudatoolkit python/3.10

export PYTHONPATH=/global/u1/n/nlewi26/src/spack/opt/spack/linux-sles15-zen3/gcc-12.3.0/lbann-0.104-654gueas7uataaqn4wkm33sx64arboqp/lib/python3.10/site-packages:${PYTHONPATH}
source /global/homes/n/nlewi26/src/spack/share/spack/setup-env.sh

spack env activate lbann
spack load lbann

export DARSHAN_CONFIG_PATH=/global/u1/n/nlewi26/jobs/lbann/darshan.conf
export DXT_ENABLE_IO_TRACE=1
export LOGPATH=/pscratch/sd/n/nlewi26/darshan-logs
export LD_PRELOAD=/global/common/software/nersc9/darshan/3.4.4/lib/libdarshan.so

# generate data
python3 /global/u1/n/nlewi26/src/lbann_sandbox/simple_example.py
