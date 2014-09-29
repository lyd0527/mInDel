##Installation

###Requirements
- Perl http://www.perl.org/
- SolexaQA http://solexaqa.sourceforge.net/
- Soapdenovo2 http://sourceforge.net/projects/soapdenovo2/ 
- Newbler http://www.454.com/products/analysis-software/
- Primer3 http://sourceforge.net/projects/primer3/
- Bowtie http://bowtie-bio.sourceforge.net/


###INSTALLATION
Here are the installation instructions for CentOS and Ubuntu Linux system.

**1. Install dependent apps and add them to system path.**

- Perl 5.10 or above
- Perl modules
```
user@Lv: sudo cpan
cpan[1]> install Getopt::Long
cpan[2]> install Config::Tiny
```

- SolexaQA
```
user@Lv: wget http://sourceforge.net/projects/solexaqa/files/src/SolexaQA_v.2.5.zip/download
user@Lv: unzip SolexaQA_v.2.5.zip
user@Lv: sudo cp SolexaQA_v.2.5/*.pl /usr/local/bin
```
- Soapdenovo2 (For illumina sequencing platform)
```
user@Lv: wget http://sourceforge.net/projects/soapdenovo2/files/latest/download
user@Lv: tar xvzf SOAPdenovo2-src-r***.tgz
user@Lv: cd SOAPdenovo2-src-r***/
user@Lv: make
user@Lv: sudo cp SOAPdenovo-63mer SOAPdenovo-127mer /usr/local/bin
```
For ubuntu:
```
sudo apt-get install soapdenovo2
```
- Newbler 
  obtain from http://www.454.com/products/analysis-software/
- Primer3
```
user@Lv: wget http://sourceforge.net/projects/primer3/files/latest/download?source=directory
user@Lv: tar xzvf primer3-src-2.*.*.tar.gz
user@Lv: cd primer3-src-2.*.*/src
user@Lv: make
user@Lv: sudo cp -r long_seq_tm_test ntdpal ntthal oligotm primer3_core primer3_config/ /usr/local/bin/
```
- Bowtie
```
wget http://sourceforge.net/projects/bowtie-bio/files/bowtie/1.1.0/bowtie-1.1.0-linux-x86_64.zip/download
unzip bowtie-1.1.0-linux-x86_64.zip
sudo cp bowtie-1.1.0/bowtie* /usr/local/bin
```

**2. Install main program.**
```
user@Lv:~/mInDel$ chmod 777 bin/*
user@Lv:~/mInDel$ sudo cp bin/* /usr/local/bin
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

**3. Example testing**
```
user@Lv: cd example
user@Lv: chmod 777 test.sh 
user@Lv:~/mInDel/example$ ./test.sh or sh test.sh 
```
