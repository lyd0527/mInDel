#!/bin/bash

cd $1
echo "\n---Trim paired-end FASTQ files\n"
for fq in $(ls -l | grep 'fastq' | awk '{print $9}' | sed 's/_[12].fastq$//g' | uniq -d )
do
   DynamicTrim.pl ${fq}_1.fastq -h $2 -454
   DynamicTrim.pl ${fq}_2.fastq -h $2 -454
   LengthSort.pl ${fq}_1.fastq.trimmed ${fq}_2.fastq.trimmed -l $3
   rm -rf *summary* *.trimmed *.discard *.single *segments *.pdf
   mv *paired1* ${fq}_1.trimmed
   mv *paired2* ${fq}_2.trimmed
done


echo "\n---Trim single FASTQ files\n"
for fq in $(ls -l | grep 'fastq' | awk '{print $9}' | sed 's/_[12].fastq$//g' | uniq -u )
do
   DynamicTrim.pl ${fq} -h $2 -454
   LengthSort.pl ${fq}.trimmed -l $3  
   rm -rf *summary* *.fastq.trimmed *.discard *segments *.pdf
   mv *single ${fq%fastq}trimmed
done


#### Example 

####input
#test1_1.fastq
#test1_2.fastq
#test2.fastq
#test3.fastq

####ouput
#test1_1.trimmed
#test1_2.trimmed
#test2.trimmed
#test3.trimmed

