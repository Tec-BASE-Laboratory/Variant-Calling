#!/bin/bash
outdir=/media/bioinfo/CoreLab1/Exomas_resultados/exomas_concat/bam_old/annovar
workdir=/media/bioinfo/CoreLab1/Exomas_resultados/exomas_concat/bam_old/bams_dedup
programdir=/home/bioinfo/annovar
for VCF in `ls *.vcf`
do
	sample_name=${VCF##*/};
	sample_name=${sample_name%%.*};
	perl $programdir/table_annovar.pl $workdir/${VCF}  $programdir/humandb/ -buildver hg38 -out $outdir/${sample_name}.hard-filtered.vcf -remove -protocol refGene,cytoBand,exac03,clinvar_20210501,dbnsfp30a -operation g,r,f,f,f  -nastring . -vcfinput -polish 
	
done
