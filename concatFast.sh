#!/bin/bash

# USAGE: sh concatFastq.sh INPUT_DIRECTORY OUTPUT_DIRECTORY
# WARNING: Must edit filename according to files.

INPUT_DIRECTORY=$1;
OUTPUT_DIRECTORY=$2;

mkdir -p ${OUTPUT_DIRECTORY}/concatFastq

for fastq in `ls ${INPUT_DIRECTORY}/*L00*_R1.fastq.gz`
do
	sample_name=${fastq##*/};
	sample_name=${sample_name%%L*};

	cat ${fastq} >> ${OUTPUT_DIRECTORY}/concatFastq/${sample_name}R1.fastq.gz
done

for fastq in `ls ${INPUT_DIRECTORY}/*L00*_R2.fastq.gz`
do
	sample_name=${fastq##*/};
	sample_name=${sample_name%%L*};

	cat ${fastq} >> ${OUTPUT_DIRECTORY}/concatFastq/${sample_name}R2.fastq.gz
done
