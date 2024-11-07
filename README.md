# fMRIPrep 

> This repository contains a demo for running fMRIPrep using Apptainer/Singularity.

## What is fMRIPrep?

fMRIPrep is a robust and open source tool for preprocessing of functional MRI data.

## Documentation

- [fMRIPrep documentation](https://fmriprep.org/en/stable/index.html)
- [fMRIPrep GitHub](https://github.com/nipreps/fmriprep)
- [fMRIPrep DockerHub](https://hub.docker.com/r/nipreps/fmriprep/tags)

## Instructions

### Download the dataset

```bash
cd data
./download.sh
```

### Pull the fMRIPrep Apptainer image

```bash
cd .apptainer
sbatch pull.sbatch
```

### Run fMRIPrep
1. Configure `setup_env.sh` with your paths. 
2. Run `sbatch fmriprep.sbatch`