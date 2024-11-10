#!/bin/bash

# Paths
BIDS_PATH=./ds000224
DERIVATIVES_PATH=./ds000224/derivatives/fmriprep

# Create the derivatives directory
mkdir -p $DERIVATIVES_PATH

# Check for freesurfer license in ~/license.txt
if [ ! -f ~/license.txt ]; then
    echo "Freesurfer license not found in ~/license.txt"
    echo "Please download the license and place it in ~/license.txt"
    echo "You can download the license from https://surfer.nmr.mgh.harvard.edu/registration.html"
    exit 1
fi

# Create virtual environment and install requirements
echo "Setting up virtual environment and installing requirements"
python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt

# Run fMRIPrep
echo "Running fMRIPrep with fMRIPrep-Docker version $(fmriprep-docker --version)"
fmriprep-docker $BIDS_PATH $DERIVATIVES_PATH participant --participant-label MSC01 --fs-license-file ~/license.txt --skip-bids-validation