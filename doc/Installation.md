##Installation

###Requirements
- Perl http://www.perl.org/
- SolexaQA http://solexaqa.sourceforge.net/
- Soapdenovo2 http://sourceforge.net/projects/soapdenovo2/ 
- Newbler http://www.454.com/products/analysis-software/
- Primer3 http://sourceforge.net/projects/primer3/
- Bowtie http://bowtie-bio.sourceforge.net/


###Installation
Here are the installation instructions for CentOS and Ubuntu Linux system.

**1. Install dependent apps and add them to system path.**

- Perl 5.10 or above

- SolexaQA++
```
[maize@corn86 ~]$ wget http://sourceforge.net/projects/solexaqa/files/src/SolexaQA%2B%2B_v3.1.3.zip/download
[maize@corn86 ~]$ unzip SolexaQA_v3.1.3.zip
[maize@corn86 ~]$ sudo cp Linux_x64/SolexaQA++ /usr/local/bin
```

- Soapdenovo2 (For illumina sequencing platform)
```
[maize@corn86 ~]$ wget http://sourceforge.net/projects/soapdenovo2/files/latest/download
[maize@corn86 ~]$ tar xvzf SOAPdenovo2-src-r***.tgz
[maize@corn86 ~]$ cd SOAPdenovo2-src-r***/
[maize@corn86 ~]$ make
[maize@corn86 ~]$ sudo cp SOAPdenovo-63mer SOAPdenovo-127mer /usr/local/bin
```

- Newbler (454 sequencing platform, http://www.454.com/products/analysis-software/)

- Primer3
```
[maize@corn86 ~]$ wget http://sourceforge.net/projects/primer3/files/latest/download?source=directory
[maize@corn86 ~]$ tar xzvf primer3-src-2.*.*.tar.gz
[maize@corn86 ~]$ cd primer3-src-2.*.*/src
[maize@corn86 ~]$ make
[maize@corn86 ~]$ sudo cp -r long_seq_tm_test ntdpal ntthal oligotm primer3_core primer3_config/ /usr/local/bin/
```

- Bowtie
```
wget http://sourceforge.net/projects/bowtie-bio/files/bowtie/1.1.0/bowtie-1.1.0-linux-x86_64.zip/download
unzip bowtie-1.1.0-linux-x86_64.zip
sudo cp bowtie-1.1.0/bowtie* /usr/local/bin
```

**2. Install main program.**
```
[maize@corn86 ~]$ chmod 777 bin/*
[maize@corn86 ~]$ sudo cp bin/* /usr/local/bin
[maize@corn86 ~]$ mInDel

Usage: mInDel [OPTION] 
     : mInDel -a a.fasta -b b.fasta
     : mInDel -a a.fasta -b b.fasta -t 10 ...

--Required
  -a sample A, query input files are (multi-)FASTA .fa/.fasta
  -b sample B, query input files are (multi-)FASTA .fa/.fasta
  -t number of alignment threads to launch (default: 4)

--overlap_fragments
  -win	window size (default: 300)
  -step	step size (default: 100)

--Probes design
  -size_min		probe size (default: 18)
  -size_maximum		max probe size (default: 22)
  -size_opt		optimum probe size (default: 20)
  -tm_min		minimum Tm value (default: 58)
  -tm_max		maximum Tm value (default: 62)
  -tm_opt		optimum Tm value (default: 60)
  -fragment_range	range of fragments (default: 200-400)

--Paired-end mapping
  -mismatch		max mismatches (can be 0-3, default: 2)
  -fragment_max		max fragment size for paired-end alignment (default: 1000)
  -fragment_min		min fragment size for paired-end alignment (default: 50)

E-mail bug reports to: <Lyd0527@jaas.ac.cn>.
```

**3. Example testing**
```
[maize@corn86 ~]$ cd example
[maize@corn86 ~]$ chmod 777 test.sh 
[maize@corn86 ~]$ ./test.sh or sh test.sh 
```
