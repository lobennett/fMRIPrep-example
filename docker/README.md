# fMRIPrep-Docker

> This repository contains a demo for running fMRIPrep using fMRIPrep-Docker.

## Instructions

### Create a directory for the project and clone the repository

```bash
git clone https://github.com/lobennett/fMRIPrep-example.git ~/fMRIPrep-example && \
cd ~/fMRIPrep-example/docker
```

### Download the dataset

```bash
chmod +x ./download.sh && ./download.sh
```

### Run the fMRIPrep Docker image

```bash
chmod +x ./docker.sh && ./docker.sh
```
