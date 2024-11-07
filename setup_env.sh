#!/bin/bash
## paths 
export BIDS_DIR=/oak/stanford/groups/russpold/data/ds000105
export DERIVS_DIR=$BIDS_DIR/derivatives/fmriprep
export WORK_DIR=./fmriprep_work_dir
## apptainer/singularity images - select the version of fMRIPrep we want to use. 
export TAG="24.1.0rc2"
export FMRIPREP_IMAGE=./.apptainer/fmriprep_${TAG}.sif
## binds
export TEMPLATEFLOW_HOST_HOME=$HOME/.cache/templateflow
export FMRIPREP_HOST_CACHE=$SCRATCH/.cache/fmriprep
## licenses
export FS_LICENSE=$HOME/license.txt
## bids filter file
export BIDS_FILTER_FILE=./bids_filter_file.json

## create directories
mkdir -p $DERIVS_DIR # fMRIPrep derivatives directory
mkdir -p $WORK_DIR # working directory