#!/bin/bash
#SBATCH -J fmriprep_ds000105
#SBATCH --time=02:00:00
#SBATCH -n 1
#SBATCH --array 1
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=16G
#SBATCH -p russpold,hns,normal,owners
# Outputs ----------------------------------
#SBATCH -o ./log/%x-%A-%a.out 
#SBATCH -e ./log/%x-%A-%a.err 
#SBATCH --mail-user=logben@stanford.edu
#SBATCH --mail-type=END 
# ------------------------------------------

: '

Name: fmriprep.sbatch

Description: This script runs fmriprep on the ds000105 dataset.

Usage: sbatch fmriprep.sbatch

Notes:
- This script sources the setup_env.sh script to set up the computing environment.
- This script assumes that the apptainer / singularity images are already built in the .apptainer directory.

The fMRIPrep singularity image assumes the following:
- BIDS data is mapped to /data in the container.
- TemplateFlow is mapped to /templateflow in the container.
- Work directory that stores temporary files is mapped to /work in the container.
'

# Prepare computing environment
source ./setup_env.sh

# Prepare apptainer/singularity command line
APPTAINER_CMD="apptainer run --cleanenv -B $BIDS_DIR:/data -B ${TEMPLATEFLOW_HOST_HOME}:/templateflow -B $WORK_DIR:/work $FMRIPREP_IMAGE"

# Compose subject ID for each array task
SUBJECT="sub-$SLURM_ARRAY_TASK_ID"

# Compose the command line with flags for fMRIPrep
cmd="$APPTAINER_CMD /data $DERIVS_DIR participant --participant-label $SUBJECT -w /work --nthreads 12 --mem_mb 192000 --output-spaces MNI152NLin2009cAsym:res-2 func anat --fs-license-file $FS_LICENSE --bids-filter-file $BIDS_FILTER_FILE --verbose"

# Show and execute the command
echo Running task ${SLURM_ARRAY_TASK_ID}
echo Commandline: $cmd
eval $cmd 
exitcode=$? # store exit code

echo Finished tasks ${SLURM_ARRAY_TASK_ID} with exit code $exitcode
exit $exitcode 