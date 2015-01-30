#!/usr/bin/perl

=head1 NAME

mapping - mapping to reference genome/assemblied contigs by paired-end mapping method.

=head1 DESCRIPTION

Aim to extract targeted fragment sizes.
 
 Author	: Yuanda Lv
 E-mail	: Lyd0527@126.com
 Date	: 10/07/2013
 Version: 1.0
=cut

use strict;
use Getopt::Long;

my $usage = q/
mapping v1.0 10-07-2013

USAGE:

mapping [-i probes_prefix] [-o output_prefix] [-d target_prefix][-m mismatch] [-s fragment_size_max] [-t thread]

Description:

parameter:
-i	probes prefix
-o	output prefix
-d	database
-m	num of mismatch (<=3)
-s	maximum fragment size
-t	num of thread
	
Example: mapping -i probes -d scaffolds -o output -m 3 -t 10
/;

die $usage."\n" if (@ARGV<1);

my $input;
my $db;
my $mismatch=0;
my $thread=4;
my $product=600;
my $output;
GetOptions(
	'i:s'	=>\$input,
	'o:s'	=>\$output,
	'd:s'	=>\$db,
	'm:n'	=>\$mismatch,
	's:n'	=>\$product,
	't:n'	=>\$thread,
);

my $formatdb="bowtie-build $db db\/db >/dev/null";
$db =~ s/\..*$//;
my $epcr1="bowtie -f -S -p $thread -a -X $product -v $mismatch $db -1 $input\_1.fa -2 $input\_2.fa | tee $output.sam | grep -v -P '\\*\t0\t0\t\\*|@|-' | cut -f 1,9 | awk '!x[\$0]++'|awk '{a[\$1]=a[\$1]\?a[\$1]\",\"\$2:\$2} END{for(i in a)print i\"\\t\"a[i]}'>$output.sizes";
my $epcr2="bowtie -f -S -p $thread -a -X $product -v $mismatch db/db -1 $input\_1.fa -2 $input\_2.fa | tee $output.sam | grep -v -P '\\*\t0\t0\t\\*|@|-'| cut -f 1,9 | awk '!x[\$0]++'|awk '{a[\$1]=a[\$1]\?a[\$1]\",\"\$2:\$2} END{for(i in a)print i\"\\t\"a[i]}'>$output.sizes";

if(-e "$db.1.ebwt") {
	system($epcr1);
}else{
	if (!(-e "db")){
		mkdir "db";
	}
	printf "bowtie_db doesn't exist. formatting it now\n";
	system($formatdb);
	system($epcr2);
}

#merge
#awk '{a[$1]=a[$1]?a[$1]","$2:$2} END{for(i in a)print i,a[i]}' i
#cut -f 1,9 |awk '!x[$0]++'|awk '{a[$1]=a[$1]?a[$1]","$2:$2} END{for(i in a)print i"\t"a[i]}'
#region
#awk '{print $1"\t"$3"\t"$8+$6-$9"\t"$8+$6"\t"$9}' 



