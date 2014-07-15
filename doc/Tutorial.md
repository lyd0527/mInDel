##Walkthrough
###Introduction

mInDel facilitates detection of Insertion/Deletion(InDel) between different genotypes/species from next generation sequencing data. In this walkthrough the main functionality of mInDel will be demonstrated by mining the InDel of two genotypes.

###Requirements
- Perl http://www.perl.org/
- SolexaQA http://solexaqa.sourceforge.net/
- Primer3 http://sourceforge.net/projects/primer3/
- Bowtie http://bowtie-bio.sourceforge.net/


####Step1: Pre-processing
Single
```
sh trim_single.sh
```
Paired-end
```
sh trim_paired.sh
```
*input files literally must be formatted by Fastq.

\*_1.fastq and \*_2.fastq represent paired-end type.

####Step2: *De novo* assembly
For illumina (*supported mix mode: paired where possible, unpaired otherwise*):
```
perl de_novo_assembly -d trimmed_dir -i trimmed -s 300 -k 45 -p 20 -o illu_project
```
For 454:
```
perl de_novo_assembly_454 -d trimmed_dir -i 95 -l 40 -p 20 -a 300 -o 454_project
```

\*paired-end files literally have to include _1 and _2 suffixes such as \*_1.trimmed and \*_2.trimmed.


####Step4: Split Sample B's contigs/chromosome to overlap fragments
```
perl overlap_framents -i B_contigs.fa -o B_contigs_300.fa -w 300 -s 150
```

####Step5: Design primer probes
```
perl primer_design_batch -input B_contigs_300.fa -output B
or
perl primer_design_batch -input B_contigs_300.fa -output B -size_min 16 -size_opt 20 -size_max 24 -product_range 200-400
```

####Step6: ePCR mapping to Sample A genome sequences and screening specific sites
```
perl ePCR_mapping -i B_probes -d A_contigs.fa -m 3 -t 10
```

####Step7: Generate candidate InDel markers
```
indel_screening.sh B.list target.list
```
