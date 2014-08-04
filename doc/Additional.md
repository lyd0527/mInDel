##Additional: 
Subroutines may be also run as separate programs for different purposes.
###Subroutines under bin/ directory
- trim_paired.sh
- trim_single.sh
- de_novo_assembly_454
- de_novo_assembly_illu
- overlap_fragments
- primer_design_batch

#### *trim_illu.sh*
It is designed for cleaning illumina reads. Excute `sh trim_illu.sh phred_score min_length` under raw reads dir.
```
user@Lv:~/mInDel/bin$ sh trim_illu.sh 20 40
```
#### *trim_454.sh*
It is designed for cleaning 454 reads. Excute `sh trim_454.sh phred_score min_length` under raw reads dir.
```
user@Lv:~/mInDel/bin$ sh trim_454.sh 20 40
```

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
