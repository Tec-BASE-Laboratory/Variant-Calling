#!/bin/bash

# USAGE: sh alignment.sh

for file in $(find ./ -type f -name "*.fastq.gz" | while read F; do basename $F | rev | cut -c 13- | rev; done | sort | uniq)

    do

bwa mem -t 50 -R "@RG\tID:$id\tSM:$id"_"$sm\tLB:$id"_"$sm\tPL:ILLUMINA" hs38DH.fa "$file"_R1.fastq.gz "$file"_R2.fastq.gz > "$file"_aln.sam

done;
