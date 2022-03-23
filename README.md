# mInDel

### Changelog 
Version 0.2.0 04/23/2015

- Added multi-samples InDel support.
- Added two main program. 
 - `mInDel_pair` was designed for two samples;
 - `mInDel_pop` was designed for multiple samples
- Added dependencies checking script `sh check_deps.sh`.
- Added non-root user install script `sh install_nonroot.sh`.
- More summary information is added, such as position information for per primer pair.

### Introduction

mInDel allows to find InDel variations between two or more genotypes and to develop InDel markers. Together with its independence to a reference genome and the downstream genotyping-aware versatility, mInDel holds great values to researchers in the fields of molecular genetics and evolutionary studies. 

mInDel mainly implements five modules: Pre-processing module, *De novo* assembly module, Overlap probes design module, paired-end mapping module and InDel screening and marker development module. 

It was tested on CentOS 6.3 and Ubuntu 12.10 server but it should work on most Linux servers.

#### - [Installation](https://github.com/lyd0527/mInDel/blob/master/doc/Installation.md)
#### - [Quick Start](https://github.com/lyd0527/mInDel/blob/master/doc/Quick_start.md)
#### - [Step By Step Tutorial](https://github.com/lyd0527/mInDel/blob/master/doc/Step_by_step_tutorial.md) 
#### - [Additional](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md) 
*Scripts may be also ran as separate programs for different purposes.*

### mInDel workflow.

**mInDel workflow.** mInDel generates a pool of probe pairs based on input sequences, infers the sizes in between these probes using improved paired-end mapping algorithm, and screens for polymorphic probes as candidate InDel markers. The pipeline accepts NGS data as input and then proceeds automatically to perform several independent analyses, most of which can be selected or excluded according to the user’s needs. Module 1: Pre-processing analysis. Module 2: De novo assembly (Illumina or 454 sequencing platform). Module 3: Overlap probes design. Module 4: paired-end mapping and specificity screening. Module 5: InDel screening and marker development.

### QUESTIONS AND COMMENTS:
Please send your any comments to Dr. Yuanda Lv, Lyd0527@jaas.ac.cn.

* Lv, Y., Liu, Y. & Zhao, H. mInDel: a high-throughput and efficient pipeline for genome-wide InDel marker development. BMC Genomics 17, 290 (2016). https://doi.org/10.1186/s12864-016-2614-5

*Copyright (c) 2014, Institute of Biotechnology, Jiangsu Academy of Agricultural Sciences.*

