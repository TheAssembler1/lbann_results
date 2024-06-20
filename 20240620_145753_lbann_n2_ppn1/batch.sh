#!/bin/bash
#SBATCH --chdir=/pscratch/sd/n/nlewi26/20240620_145753_lbann_n2_ppn1
#SBATCH --output=/pscratch/sd/n/nlewi26/20240620_145753_lbann_n2_ppn1/out.log
#SBATCH --error=/pscratch/sd/n/nlewi26/20240620_145753_lbann_n2_ppn1/err.log
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=lbann

echo "Started at $(date)"
srun --chdir=/pscratch/sd/n/nlewi26/20240620_145753_lbann_n2_ppn1 --nodes=2 --ntasks=2 --ntasks-per-node=1 --job-name=lbann /global/u1/n/nlewi26/src/spack/opt/spack/linux-sles15-zen3/gcc-12.3.0/lbann-0.104-654gueas7uataaqn4wkm33sx64arboqp/bin/lbann --prototext=/pscratch/sd/n/nlewi26/20240620_145753_lbann_n2_ppn1/experiment.prototext
status=$?
echo "Finished at $(date)"
exit ${status}
