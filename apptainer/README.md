# fMRIPrep 

> This repository contains a demo for running fMRIPrep using Apptainer/Singularity.

## Instructions

### SSH into Sherlock 

```bash
ssh <username>@login.sherlock.stanford.edu
```

### Create a directory for the project and clone the repository

```bash
git clone https://github.com/lobennett/fMRIPrep-example.git $SCRATCH/fMRIPrep-example && \
cd "$SCRATCH/fMRIPrep-example/apptainer"
```

### Download the dataset

```bash
chmod +x download.sh && ./download.sh
```

### Pull the fMRIPrep Apptainer image

```bash
sbatch pull.sbatch
```

### Run fMRIPrep
1. Configure `setup_env.sh` with your paths. 
2. Run `sbatch fmriprep.sbatch`