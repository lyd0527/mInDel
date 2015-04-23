#!/bin/sh -eu
 
#  Detecting certain dependencies.
#  Created by Yuanda Lv on 04/23/15.
#  Lyd0527@jaas.ac.cn
 

###define functions
check_dep() {
    which $1 >/dev/null 2>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "$1 ....\e[1;32minstalled\e[0m"   | awk '{printf "    %-40s %-40s\n",$1,$2}' 
    else
        echo -e "$1 ....\e[1;31mNo_found\e[0m" | awk '{printf "    %-40s %-40s\n",$1,$2}'
    fi
}
 
check_file() {
    if [ -e "$1" ]; then
        echo -e "$1 ....\e[1;32mOK\e[0m"       | awk '{printf "    %-10s  %-40s %-40s\n",$1,$2,$3}'
    else
        echo -e "$1 ....\e[1;31mNo_found\e[0m" | awk '{printf "    %-10s  %-40s %-40s\n",$1,$2,$3}'
    fi
}

echo -e "\n>>>>>>dependencies:  <<<<<<"
check_dep "perl"
check_dep "bowtie"
check_dep "SolexaQA++"
check_dep "primer3_core"
check_dep "SOAPdenovo-127mer"

echo -e "\n>>>>>>mInDel_modules:<<<<<<"
check_dep "overlap"
check_dep "mapping"
check_dep "merge_col"
check_dep "probes_design"
check_dep "InDel_screening"
