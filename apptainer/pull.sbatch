#!/bin/bash
#SBATCH -J pull
#SBATCH --time=00:10:00
#SBATCH -n 1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4G
#SBATCH -p russpold,hns,normal,owners
# Outputs ----------------------------------
#SBATCH -o ./log/%x-%A-%a.out 
#SBATCH -e ./log/%x-%A-%a.err 
#SBATCH --mail-user=logben@stanford.edu
#SBATCH --mail-type=END 
# ------------------------------------------

: '

Name: pull.sbatch

Description: This script pulls the fMRIPrep image into your $SCRATCH/.apptainer directory.

Usage: sbatch pull.sbatch

'

# Create $SCRATCH/.apptainer directory if it doesn't exist
mkdir -p $SCRATCH/.apptainer

# Pull the fMRIPrep image from DockerHub
apptainer pull $SCRATCH/.apptainer/fmriprep_24.1.0rc2.sif docker://nipreps/fmriprep:24.1.0rc2