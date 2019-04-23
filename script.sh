#!/usr/bin/env bash

bowtie2 -x /mnt/workflow_data/raw_data/indexFileName/$raw_data.indexFileName -1 /mnt/workflow_data/raw_data/input/*_1.fq -2 /mnt/workflow_data/raw_data/input/*_2.fq -S /mnt/results/foo.sam