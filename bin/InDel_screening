#!/usr/bin/perl -w

use strict;

my $a=$ARGV[0];
my $b=$ARGV[1];
my @f1;
my @f2;
my %f1;
my %f2;
my $keys;
my $keys2;

open f1, "<$a";
open f2, "<$b";

while(<f2>){
	chomp;
	my @f2 = split (/\t/,$_); 
	$keys=shift @f2; #left move
	$f2{$keys} = join("\t",@f2);
}

while(<f1>){
	chomp; 
	@f1=split (/\t/,$_); 
        $keys2=shift @f1;
	if (exists $f2{$keys2}) {
		print $_."\t".$f2{$keys2}."\n";
	}
} 

