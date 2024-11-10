#!/bin/bash

if ! command -v datalad &> /dev/null; then
    echo "datalad is not installed. You can install it by following the instructions at https://handbook.datalad.org/en/latest/intro/installation.html"
    exit 1
fi

echo "Pulling the dataset with datalad version: $(datalad --version)"
datalad install https://github.com/OpenNeuroDatasets/ds000224.git