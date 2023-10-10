## Additional: 
All scripts may be also run as separate programs for different purposes.

### Subroutines under bin/ directory
- [trim_fastq](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#trim_fastq)
- [de_novo_assembly_454](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#de_novo_assembly_454)
- [de_novo_assembly_illu](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#de_novo_assembly_illu)
- [overlap_fragments](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#overlap_fragments)
- [probes_design](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#probes_design)
- [mapping](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#mapping)
- [InDel_screening](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md#InDel_screening)

#### *trim_fastq*
It is designed for cleaning illumina/454 fastq reads. Excute `trim_fastq [OPTION]` under raw reads dir.
```
[maize@corn86 ~]$ trim_fastq 
Usage: trim_fastq [OPTION] ... -d fastq_dir

 -p	min phred score, [default=20]
 -l	min length, [default=40]
 -d	fastq_dir
 -s	toggle to 454 fastq file
 -h	help

--------------------------
	Input_dir/fastq:
	test1_1.fastq
	test1_2.fastq
	test2.fastq
	test3.fastq

	ouput_files:
	test1_1.trimmed
	test1_2.trimmed
	test2.trimmed
	test3.trimmed
--------------------------

E-mail bug reports to: <Lyd0527@jaas.ac.cn>.
```

#### *de_novo_assembly_illu*
de_novo_assembly_illu - Calling Soapdenovo program to assemble illumina reads.
```
[maize@corn86 ~]$ de_novo_assembly_illu
de_novo_assembly_illu v1.0 10-07-2013

USAGE:

de_novo_assembly_illu [-d directory path] [-i file_suffix] [-s insert_size] [-k kmer_size] [-p thread] [-o output_prefix]

Description:
parameter:
-d  directory path
-i  file_suffix
-s  insert size of library
-k  kmer size, default 45;
-p  num of thread, default 10;
-o  output_prefix

Example: de_novo_assembly_illu -d trimmed_dir -i trimmed -s 300 -k 45 -p 20 -o illu_project
```

#### *de_novo_assembly_454*
de_novo_assembly_454 - Calling Newbler program to assemble 454 reads.
```
[maize@corn86 ~]$ de_novo_assembly_454 

de_novo_assembly_454 v1.0 10-07-2013

USAGE:

de_novo_assembly_454 [-d directory path] [-p thread] [-i identity_percent] 
[-l overlap_length]  [-a contig_length] [-o output_dir]

Description:

parameter:
-d  directory path
-i  minimum overlap percent identity, default 90.
-l  minimum overlap length, default 40.
-p  num of thread
-a  minimum contig length, default 100.
-o  output_dir

Example: de_novo_assembly_454 -d trimmed_dir -i 95 -l 40 -p 20 -a 300 -o 454_project

```

#### *overlap_fragments*
overlap_fragments - generate overlap fragments by sliding window algorithm.
```
[maize@corn86 ~]$ perl overlap_fragments 
overlap_fragments v1.0 20-05-2012

USAGE:

overlap_fragments [-i input] [-o output] [-w window size] [-s step size]

Description:
parameter:
-i	input:Fasta-formated nucleotide sequences
-o	output
-w	window size
-s	step size
	
Example: overlap_framents -i seq.fa -o seq_fragment.fa -w 300 -s 100

```

#### *probes_design*
probes_design - calling external primer3 program to design primer probes in batch mode.
```
[maize@corn86 ~]$ primer_design_batch
primer_design_batch v1.0 07-10-2013

USAGE:
probes_design [-input <FASTA>] [-num <primer number>] [-size_min <Primer_min_size>] [-size_max <Primer_max_size>] 
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
probes_design -input example.fa -output example
probes_design -input example.fa -output example -size_min 16 -size_opt 20 -size_max 24 -product_range 200-400
```

#### *mapping*
mapping - perform paired-end mapping to infer targeted fragment sizes.

```
[maize@corn86 ~]$ mapping
mapping v1.0 10-07-2013

USAGE:

mapping [-i probes_prefix] [-o output_prefix] [-d target_prefix][-m mismatch] [-s fragment_size_max] [-t thread]

Description:

parameter:
-i	probes prefix
-o	output prefix
-d	database
-m	num of mismatch (<=3)
-s	maximum fragment size
-t	num of thread
	
Example: mapping -i probes -d scaffolds -o output -m 3 -t 10

```

#### *InDel_screening*
InDel_screening - screen InDel markers.

```
[maize@corn86 ~]$ Indel_screening A_probes.list target_B.size | awk '($8!=$9)' >candidate_InDel_markers
```
