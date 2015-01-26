#!/usr/bin/perl -w

=head1 NAME

de_novo_assembly_454.

=head1 DESCRIPTION

allows you to assemble a set of contiguous sequences (contigs) with the Newbler program..
 
 Author	: Yuanda Lv
 E-mail	: Lyd0527@126.com
 Date	: 10/07/2013
 Version: 1.0
=cut

use strict;
use Getopt::Long;

my $usage = q/
de_novo_assembly_454 v1.0 10-07-2013

USAGE:

de_novo_assembly_454 [-d directory path] [-p thread] [-i identity_percent] [-l overlap_length]  [-a contig_length] [-o output_dir]

Description:

parameter:
-d  directory path
-i  minimum overlap percent identity, default 90.
-l  minimum overlap length, default 40.
-p  num of thread
-a  minimum contig length, default 100.
-o  output_dir

Example: de_novo_assembly_454 -d trimmed_dir -i 95 -l 40 -p 20 -a 300 -o 454_project
/;

die $usage."\n" if (@ARGV<1);


my $dir; # or $dir-cwd();
my $identity=90;
my $overlap=40;
my $contig_len=100;
my $thread=1;
my $output="454_project";
my $list;
my $files;

GetOptions(
	'd:s'	=>\$dir,
	'i:n'	=>\$identity,
	'l:n'	=>\$overlap,
	'a:n'	=>\$contig_len,
	'p:n'	=>\$thread,
	'o:s'	=>\$output,
);

#generate configure file

$dir=~s/\/$//g;
open( $list, "ls $dir |") or die "$!";
while ( <$list> ) {
	chomp;
	$files.= $dir."/".$_." ";
}

#calling Newbler to assemble...

print "Starting de novo assembly.....\n";

`runAssembly -o $output -mi $identity -ml $overlap -a $contig_len $files`;

print "\n-----Done\n-----\n";

print "Assemly job  has been finished.Good Luck!!!\n\n";

