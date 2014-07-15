#!/bin/bash

for fq in $(ls -l | grep 'fastq' | awk '{print $9}' | sed 's/_[12].*$//g' | uniq )
do
   perl DynamicTrim.pl ${fq}_1.fastq -h 20
   perl DynamicTrim.pl ${fq}_2.fastq -h 20
   perl LengthSort.pl ${fq}_1.fastq.trimmed ${fq}_2.fastq.trimmed -l 40
   rm -rf *.discard *.single
done


#### Example 

#### test_1.fastq and test_2.fastq