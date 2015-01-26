##Quick Start

###Sample A vs Sample B

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
```
mInDel -a A.fasta -b B.fasta -t 10
```

\*\*mInDel pipeline include four modules: *overlap_fragment*, *probes_design*, *mapping* and *InDel screening*.