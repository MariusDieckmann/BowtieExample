#!/usr/bin/env bash

bowtie2 -x /mnt/workflow_data/raw_data/index/$raw_data_indexFileName -1 /mnt/workflow_data/raw_data/input/*_1.fq -2 /mnt/workflow_data/raw_data/input/*_2.fq -S /mnt/workflow_data/results/foo.sam