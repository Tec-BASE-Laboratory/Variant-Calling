#!/bin/bash

# USAGE: sh samtools.sh

for sam in `ls *.sam`
do
	sample_name={sam%%.*}
	samtools view -Sb ${sam} > ${sam%%.*}.bam
done

rm -f *.sam
