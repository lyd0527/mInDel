#!/bin/bash

for fq in *.fastq
do
   perl DynamicTrim.pl $fq -h 20
   perl LengthSort.pl ${fq}.trimmed -l 40
done

#### Example 

#### test.fastq