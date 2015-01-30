#!/bin/bash 

#trim_fastq.sh

help(){

    echo "Usage: trim_fastq [OPTION] ... -d fastq_dir"
    echo ""
    echo -e " -p\tmin phred score, [default=20]"
    echo -e " -l\tmin length, [default=40]"
    echo -e " -d\tfastq_dir"
    echo -e " -s\ttoggle to 454 fastq file"
    echo -e " -h\thelp\n"

    echo "--------------------------"
    echo -e "\tInput_dir/fastq:"
    echo -e "\ttest1_1.fastq"
    echo -e "\ttest1_2.fastq"
    echo -e "\ttest2.fastq"
    echo -e "\ttest3.fastq"
    echo ""
    echo -e "\touput_files:"
    echo -e "\ttest1_1.trimmed"
    echo -e "\ttest1_2.trimmed"
    echo -e "\ttest2.trimmed"
    echo -e "\ttest3.trimmed"
    echo "--------------------------"

    echo ""
    echo "E-mail bug reports to: <Lyd0527@jaas.ac.cn>."
    exit 1

}

if [ $# -lt 4 ]
then
    help
fi

while getopts :p:l:d:h:s OPTION 
do
    case $OPTION in
        p) phred=$OPTARG ;;
        l) length=$OPTARG ;;
        d) dir=$OPTARG ;;
        s) platform="-t" ;;
        h) help ;;
        \?) echo "Invalid param" ;;
    esac
done

cd $dir

#echo -e "\n---Trim paired-end FASTQ files\n"

for fq in $(ls -l | grep 'fastq' | awk '{print $9}' | sed 's/_[12].fastq$//g' | uniq -d )
do
   SolexaQA++ dynamictrim ${fq}_1.fastq -h $phred $platform
   SolexaQA++ dynamictrim ${fq}_2.fastq -h $phred $platform
   SolexaQA++ lengthsort ${fq}_1.fastq.trimmed ${fq}_2.fastq.trimmed -l $length
   rm -rf *summary* *.trimmed *.discard *.single *segments *.pdf
   mv *paired1* ${fq}_1.trimmed
   mv *paired2* ${fq}_2.trimmed
done


#echo -e "\n---Trim single FASTQ files\n"

for fq in $(ls -l | grep 'fastq' | awk '{print $9}' | sed 's/_[12].fastq$//g' | uniq -u )
do
   SolexaQA++ dynamictrim ${fq} -h $phred
   SolexaQA++ lengthsort ${fq}.trimmed -l $length 
   rm -rf *summary* *.fastq.trimmed *.discard *segments *.pdf
   mv *single ${fq%fastq}trimmed
done

