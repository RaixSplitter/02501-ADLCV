#!/bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q gpuv100
### -- set the job Name -- 
#BSUB -J My_Application
### -- ask for number of cores (default: 1) -- 
#BSUB -n 4
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 4GB of memory per core/slot -- 
#BSUB -R "rusage[mem=16GB]"
### -- Select the resources: 1 gpu in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M 16GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 24:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
## BSUB -u your_email_address
### -- send notification at start -- 
## BSUB -B 
### -- send notification at completion -- 
## BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o logs/hpc/%J.out 
#BSUB -e logs/hpc/%J.err 

# here follow the commands you want to execute with input.in as the input file

source /zhome/8a/9/155399/Programmering/02501-ADLCV/.venv/bin/activate

python3 classifier_train.py