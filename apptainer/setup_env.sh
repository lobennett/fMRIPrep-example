#!/bin/bash

export BIDS_DIR=./ds000105
export DERIVS_DIR=$BIDS_DIR/derivatives/fmriprep
export WORK_DIR=./fmriprep_work_dir

export TAG="24.1.0rc2"
export FMRIPREP_IMAGE=$SCRATCH/.apptainer/fmriprep_${TAG}.sif

export TEMPLATEFLOW_HOST_HOME=$HOME/.cache/templateflow
export FMRIPREP_HOST_CACHE=$SCRATCH/.cache/fmriprep

export FS_LICENSE=$HOME/license.txt
export BIDS_FILTER_FILE=./bids_filter_file.json

mkdir -p $DERIVS_DIR
mkdir -p $WORK_DIR