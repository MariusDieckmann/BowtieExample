#!/usr/bin/env bash

mkdir -p /mnt/workflow_data/tmp
bowtie2 -x /mnt/workflow_data/raw_data/index/$raw_data_indexFileName -1 /mnt/workflow_data/raw_data/input/*_1.fq -2 /mnt/workflow_data/raw_data/input/*_2.fq -S /mnt/workflow_data/tmp/foo.sam
samtools view -bS /mnt/workflow_data/tmp/foo.sam > /mnt/workflow_data/tmp/foo.bam
samtools sort /mnt/workflow_data/tmp/foo.bam -o /mnt/workflow_data/results/foo.sorted.bam