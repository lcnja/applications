#!/bin/bash
# Abaqus SubmitScript
# Optimized for run parallel job 
######################################################
#SBATCH -J Abaqus_TEST
#SBATCH -A uoa99999         # Project Account
#SBATCH --time=08:00:00     # Walltime
#SBATCH --ntasks=24         # number of tasks
#SBATCH --mem-per-cpu=8192  # memory/cpu (in MB)
#SBATCH -C wm               # sb=Sandybridge,wm=Westmere
######################################################
###  Load the module

module load Abaqus

######################################################
###  The files will be allocated in the shared FS
###  uncomment if you have large data sets.
#cp myinput.inp $SCRATCH_DIR
#cd $SCRATCH_DIR
########

source /share/SubmitScripts/slurm/slurm_setup_abaqus-env.sh
######################################################
###  Run the Parallel Program
abaqus job=test input=myinput.inp cpus=$SLURM_NTASKS -verbose 1 standard_parallel=all mp_mode=mpi interactive
######################################################
###  Transferring the results to the home directory ($HOME)
###  Uncomment if you have large data sets
#mkdir -p /projects/<myproject>/OUT
#cp -pr $SCRATCH_DIR /projects/<myproject>/OUT/
