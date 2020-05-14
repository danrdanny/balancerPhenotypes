#!/usr/bin/perl

use warnings;
use strict;

my $readFile = $ARGV[0];

my %readIDs;
#open INF,"readIDs.of.breakpoints.dat";
#open INF,"In2LCy-readIDs.dat";
#open INF,"In3RC-readIDs.dat";
#open INF,"In3RC-readIDs-proximalOnly.dat";
open INF,"In3RC-AC-readIDs-distalOnly.dat";
#open INF,"$readFile";
while (<INF>) {
	chomp($_);
	$readIDs{$_} = 1;
}
close INF;

while (<>) {

	unless (/^\@/) {
		warn "$_ should have had an \@ at the start and it didn't\n";
		next;
	}

	my $id1 = $_;
	my $seq = <>;
	my $id2 = <>;
	my $qual = <>;

	my($currReadID) = $id1 =~ /^\@(\S+)\s/;

	next unless $readIDs{$currReadID};

	print $id1,$seq,$id2,$qual;
}
