#!/usr/bin/env bash

bowtie2 -x ./example/index/lambda_virus -1 /mnt/workflow_data/raw_data/input/*_1.fq -2 /mnt/workflow_data/raw_data/input/*_2.fq -S /mnt/results/foo.sam