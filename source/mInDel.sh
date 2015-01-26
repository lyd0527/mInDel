#!/bin/bash 
set -e

#mInDel.sh

help(){

    echo "Usage: mInDel [OPTION] "
    echo "     : mInDel -a a.fasta -b b.fasta"
    echo "     : mInDel -a a.fasta -b b.fasta -t 10 ..."

    echo -e "\n--Required"
    echo -e "  -a sample A, query input files are (multi-)FASTA .fa/.fasta"
    echo -e "  -b sample B, query input files are (multi-)FASTA .fa/.fasta"
    echo -e "  -t number of alignment threads to launch (default: 4)"

    echo -e "\n--overlap_fragments"
    echo -e "  -win\twindow size (default: 300)"
    echo -e "  -step\tstep size (default: 100)"
    echo -e "\n--Probes design"
    echo -e "  -size_min\t\tprobe size (default: 18)"
    echo -e "  -size_maximum\t\tmax probe size (default: 22)"
    echo -e "  -size_opt\t\toptimum probe size (default: 20)"
    echo -e "  -tm_min\t\tminimum Tm value (default: 58)"
    echo -e "  -tm_max\t\tmaximum Tm value (default: 62)"
    echo -e "  -tm_opt\t\toptimum Tm value (default: 60)"
    echo -e "  -fragment_range\trange of fragments (default: 200-400)"
    echo -e "\n--Paired-end mapping"
    echo -e "  -mismatch\t\tmax mismatches (can be 0-3, default: 2)"
    echo -e "  -fragment_max\t\tmax fragment size for paired-end alignment (default: 1000)"
    echo -e "  -fragment_min\t\tmin fragment size for paired-end alignment (default: 50)"

    echo -e "\nE-mail bug reports to: <Lyd0527@jaas.ac.cn>."
    exit 1

}

if [ $# -lt 4 ]
then
    help
fi

###Global variables
a="" # Sample A
b="" # Sample B
thread=4 #thread number

###overlap_fragments
win=300
step=100

###probes_design
size_min=18
size_max=22
size_opt=20
tm_min=58
tm_max=62
tm_opt=60
fragment_range=200-400

###paired-end mapping
mismatch=3
fragment_max=1000
fragment_min=50

###getopts

while getopts :a:b:t:h:win:step:size_min:size_max:size_opt:tm_min:tm_max:tm_opt:fragment_range:mismatch:fragment_max: OPTION 
do
    case $OPTION in
        a) a=$OPTARG ;;
        b) b=$OPTARG ;;
        t) t=$OPTARG ;;
        win)	win=$OPTARG ;;
        step)	step=$OPTARG ;;
        size_min) size_min=$OPTARG ;;
        size_max) size_max=$OPTARG ;;
        size_opt) size_opt=$OPTARG ;;
        tm_min) tm_min=$OPTARG ;;
        tm_max) tm_max=$OPTARG ;;
        tm_opt) tm_opt=$OPTARG ;;
        fragment_range) fragment_range=$OPTARG ;;
        mismatch) mismatch=$OPTARG ;;
        fragment_max) fragment_max=$OPTARG ;;
        h) help ;;
        \?) echo "Invalid param" ;;
    esac
done

###manager results
mkdir -p 1.probes
mkdir -p 2.mapping
mkdir -p 3.InDel_markers

###step running
overlap_fragments -i $a -o 1.probes/${a%.*}_fragments.fa -w $win -s $step
probes_design -input 1.probes/${a%.*}_fragments.fa -output 1.probes/${a%.*}_probes -size_min $size_min -size_opt $size_opt -size_max $size_max -product_range $fragment_range
mv p3_* 1.probes
mapping -i 1.probes/${a%.*}_probes -d $a -s $fragment_max -m $mismatch -t $thread -o ${b%.*}
mv ${b%.*}.sam ${b%.*}.sizes 2.mapping
InDel_screening 1.probes/${a%.*}_probes.list 2.mapping/${b%.*}.sizes | awk '($8!=$9)' > 3.InDel_markers/${a%.*}_${b%.*}_InDel_candidate_markers
