## Walkthrough
### Introduction

mInDel facilitates detection of Insertion/Deletion(InDel) between different genotypes/species from next generation sequencing data. In this walkthrough the main functionality of mInDel will be demonstrated by mining the InDel of two genotypes.

### Genotype A and B

#### - Processing Genotype A (Step1, 2, 3, 4)

#### Step1: Reads cleaning
illumina sequencing reads
```
trim_fastq -p 20 -l 40 -d A_raw_fastq/
```

* - Input files literally must be formatted by Fastq and suffix is *.fastq.*

* - Paired-end reads must be named by \*\_1.fastq and \*\_2.fastq.

* - support for single, paired-end reads and mixed mode.*

#### Step2: *De novo* assembly
For illumina (*supported mix mode: paired where possible, unpaired otherwise*):
```
de_novo_assembly_illu -d trimmed_dir -i trimmed -s 300 -k 45 -p 20 -o illu_project
```
For 454:
```
perl de_novo_assembly_454 -d trimmed_dir -i 95 -l 40 -p 20 -a 300 -o 454_project
```

\* paired-end files literally have to include _1 and _2 suffixes such as \*_1.trimmed and \*_2.trimmed.


#### Step3: Split Genotype A's contigs/chromosome to overlap fragments
```
overlap_framents -i A_contigs.fa -o A_contigs_300.fa -w 300 -s 150
```

#### Step4: Design primer probes
```
probes_design -input A_contigs_300.fa -output A -size_min 16 -size_opt 20 -size_max 24 -product_range 200-400
```

#### - Processing B 
**1. with reference genome**
use the reference file as target database directly.

**2. without reference genome (Step 1, 2)**
Repeat the previous step1,2 and take assemblied contigs as target database.


#### Step5: ePCR mapping to genotype B's genome sequences and screening specific sites
```
mapping -i A_probes -d B_contigs.fa/B_ref.fa -m 3 -s 600 -t 10
```

#### Step6: Generate candidate InDel markers
```
Indel_screening A_probes.list target_B.size | awk '($8!=$9)' >candidate_InDel_markers
```
