##Quick Start
```
user@Lv:~/mInDel$ mInDel
mInDel v1.0 10-06-2014

USAGE:

perl mInDel [-a genotypeA] [-b genotypeB] [-c config_file] [-o output_dir]

Description:

parameter:
-a  dir:seq_platform(illu/454):seq_type(paired/single), example: genotypeA:illu:paired
-b  two modes:
    1.with ref. genome. directly input genome FASTA file. For example: b.fa
    2.without ref. genome. [seq_dir:seq_platform(illu/454)]. For example: genotypeB:454
-c  config_file, default: ./mindel.config
-o  output_dir

Example: 
perl mInDel -a A_dir:illu -b B_dir:454:ref -c mindel.config -o AB_InDel_project
perl mInDel -a A_dir:illu -b B_dir/ref.fa -c mindel.config -o AB_InDel_project
```
##Testing example
```
user@Lv:~/mInDel$ cd example
user@Lv:~/mInDel$ sh test.sh

**********************************
*Genotype A will be processed... *
**********************************
Step1:Reads Trimming...Done
Step2:De novo assembly...Done
Step3:Generate overlap fragments...Done
Step4:Design probes ...Done

**********************************
*Genotype B will be processed... *
**********************************
genotypeB has reference genome sequences. Convert to reference mode!
ignore Step1,Step2 !
create database directory...Done

**********************************
*Step5:ePCR mapping is running...*
**********************************
# reads processed: 989
# reads with at least one reported alignment: 916 (92.62%)
# reads that failed to align: 17 (1.72%)
# reads with alignments suppressed due to -m: 56 (5.66%)
Reported 916 paired-end alignments to 1 output stream(s)
**********************************

**********************************
*Step6:InDel screening...        *
**********************************
All jobs have finished. Enjoy~

```
