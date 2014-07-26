##mInDel

###Introduction

mInDel allows to find InDel variations between two or more genotypes and to develop InDel markers. mInDel requires next generation sequencing data of genomic DNA. It may be used for measuring InDel variation between populations, for genome wide association studies and for QTL fine mapping.

mInDel mainly implements five modules: the Pre-processing module, the *De novo* assembly module, the Overlap PCR primer design in batch module ,the ePCR mapping module and the InDel screening and marker development module. 

It was tested on CentOS 6.3 and Ubuntu 12.10 server but it should work on most Linux servers.

#### - [Installation](https://github.com/lyd0527/mInDel/blob/master/doc/Installation.md)
#### - [Quick Start](https://github.com/lyd0527/mInDel/blob/master/doc/Quick_start.md)
#### - [Step By Step Tutorial](https://github.com/lyd0527/mInDel/blob/master/doc/Step_by_step_tutorial.md) 
#### - [Additional](https://github.com/lyd0527/mInDel/blob/master/doc/Additional.md) 
*Subroutines may be also run as separate programs for different purposes.*

### mInDel workflow.
Graphic summary of mInDel workflow: the pipeline accepts NGS data as input and then proceeds automatically to perform several independent analyses, most of which can be selected or excluded according to the user’s needs. Module 1: Pre-process analysis. Module 2: De novo assembly (Illumina or 454 sequencing platform). Module 3: Overlap primer design. Module 4: ePCR mapping and specificity screening. Module 5: InDel screening and marker development.
![workflow](https://github.com/lyd0527/mInDel/blob/master/doc/workflow.png)


### QUESTIONS AND COMMENTS:
Please send your any comments to Dr. Yuanda Lv, Lyd0527@jaas.ac.cn.

*Copyright (c) 2014, Institute of Biotechnology, Jiangsu Academy of Agricultural Sciences.*
