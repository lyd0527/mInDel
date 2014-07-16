##mInDel

###Introduction

mInDel allows to find InDel variations between two or more genotypes and to develop InDel markers. mInDel requires next generation sequencing data of genomic DNA. It may be used for measuring InDel variation between populations, for genome wide association studies and for QTL fine mapping.

mInDel mainly implements five modules: the Pre-processing module, the De novo assembly module, the overlap PCR primer design in batch module ,the ePCR mapping module and InDel screening and marker development module. In the following, we describe the mInDel pipeline for InDel marker development. The mInDel pipeline comprises one pre-processing step, three main marker discovery steps and a post-processing step.

It was tested on CentOS6.3 and ubuntu 12.10 server but it should work in most Linux servers.

###Requirements
- Perl http://www.perl.org/
- SolexaQA http://solexaqa.sourceforge.net/
- Soapdenovo2 
- Newbler 
- Primer3 http://sourceforge.net/projects/primer3/
- Bowtie http://bowtie-bio.sourceforge.net/


###INSTALLATION
Here are the installation instructions for CentOS and Ubuntu Linux system.

**1. Install dependent apps and set environment variables.**

**2. Testing**
```
1)Change directory to the directory to "example",
2)Change directory permissions: chmod 777 test.sh. 
3)user@Lv:~/mInDel/example$ ./example.sh or sh test.sh 
```
**3. Running main program.**
```
user@Lv:~/mInDel$ perl bin/mInDel
```
or add bin/* to system path
```
user@Lv:~/mInDel$ chmod 777 bin/* && cp bin/* /usr/local/bin (need root privilege)
user@Lv:~/mInDel$ mInDel 
```



##Additional:
###Scripts under bin/ directory
- trim_paired.sh
- trim_single.sh
- de_novo_assembly_454
- de_novo_assembly_illu
- overlap_fragments
- primer_design_batch

#### *trim_paired.sh *
It is designed for cleaning paired-end reads. Excute `sh trim_paired.sh` under raw reads dir.

#### *trim_single.sh*
It is designed for cleaning paired-end reads. Excute `sh trim_single.sh` under raw reads dir.

#### *de_novo_assembly_454*
de_novo_assembly_454 - Calling Newbler program to assemble 454 reads.
```
user@Lv:~/mInDel/bin$ perl de_novo_assembly_454 

de_novo_assembly_454 v1.0 10-07-2013

USAGE:

perl de_novo_assembly_454 [-d directory path] [-p thread] [-i identity_percent] 
[-l overlap_length]  [-a contig_length] [-o output_dir]

Description:

parameter:
-d  directory path
-i  minimum overlap percent identity, default 90.
-l  minimum overlap length, default 40.
-p  num of thread
-a  minimum contig length, default 100.
-o  output_dir

Example: perl de_novo_assembly_454 -d trimmed_dir -i 95 -l 40 -p 20 -a 300 -o 454_project

```

#### *de_novo_assembly_illu*
de_novo_assembly_illu - Calling Soapdenovo program to assemble illumina reads.
```
user@Lv:~/mInDel/bin$ perl de_novo_assembly_illu
de_novo_assembly_illu v1.0 10-07-2013

USAGE:

perl de_novo_assembly_illu [-d directory path] [-i file_suffix] [-s insert_size] [-k kmer_size] [-p thread] [-o output_prefix]

Description:

parameter:
-d  directory path
-i  file_suffix
-s  insert size of library
-k  kmer size, default 45;
-p  num of thread, default 10;
-o  output_prefix

Example: perl de_novo_assembly_illu -d trimmed_dir -i trimmed -s 300 -k 45 -p 20 -o illu_project
```

#### *overlap_fragments*
overlap_fragments - generate overlap fragments by sliding window algorithm.
```
user@Lv:~/mInDel/bin$ perl overlap_fragments 
overlap_fragments v1.0 20-05-2012

USAGE:

perl overlap_fragments [-i input] [-o output] [-w window size] [-s step size]

Description:
	
parameter:
-i	input:Fasta-formated nucleotide sequences
-o	output
-w	window size
-s	step size
	
Example: perl overlap_framents -i seq.fa -o seq_fragment.fa -w 300 -s 100

```
#### *primer_design_batch*
primer_design_batch - calling external primer3 program to design primer probes in batch mode.
```
user@Lv:~/mInDel/bin$ perl primer_design_batch
primer_design_batch v1.0 07-10-2013

USAGE:
perl primer_design [-input <FASTA>] [-num <primer number>] [-size_min <Primer_min_size>] [-size_max <Primer_max_size>] 
[-size_opt <Primer_opt_size>] [-tm_min <Primer_min_tm>] [-tm_max <Primer_max_tm>] [-tm_opt <Primer_opt_tm>] 
[-product_range <Primer_product_size_range>] [-threads <threads>] [-output <output>] 

Description:
	
parameter:
-input files
	-input: Fasta-formated nucleotide sequences

-primer_parameters
	-size_min:	Primer_min_size		< default : 18 >
	-size_max:	Primer_max_size		< default : 22 >
	-size_opt:	Primer_opt_size		< default : 20 >

	-tm_min:	Primer_min_Tm		< default : 55 >
	-tm_max:	Primer_max_Tm		< default : 65 >
	-tm_opt:	Primer_opt_Tm		< default : 60 >

	-product_range	Primer_product_size_range < default :150-280 >

-output files
	-output:	output_prefix 	< default :output.list,output_F.fa,output_R.fa >

	
Example: 
perl primer_design_batch -input example.fa -output example
perl primer_design_batch -input example.fa -output example -size_min 16 -size_opt 20 -size_max 24 -product_range 200-400

```


**QUESTIONS AND COMMENTS:**
Please send your any comments to Dr. Yuanda Lv, Lyd0527@jaas.ac.cn.

*Copyright (c) 2014, Institute of Biotechnology, Jiangsu Academy of Agricultural Sciences.*
