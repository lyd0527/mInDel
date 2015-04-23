##Quick Start

###Pre-assembly Fastq files

- Trimming quality and length
```
trim_fastq -p 20 -l 40 -d A_raw_fastq/
```

- *de novo* assembly for illumina fastq files
```
de_novo_assembly_illu -d A_raw_fastq/ -i trimmed -s 300 -k 45 -p 20 -o illu_project
```

- *de novo* assembly for 454 fastq files
```
de_novo_assembly_454 -d A_raw_fastq/ -i 95 -l 40 -p 20 -a 300 -o 454_project
```

###InDel marker development

version 0.2.0 updated 04/23/2015

- **mInDel_pair** for two Sample
```
mInDel_pair -a A.fasta -b B.fasta -t 10
```

- **mInDel_pop** for multiple Samples
```
mInDel_pop -a A.fasta -b B_dir -t 10
```
