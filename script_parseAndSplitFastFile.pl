#!/usr/bin/perl

use strict;

# output is fasta

while (<>) {
	my $id1 = $_;
	my $seq = <>;

	next if $id1 =~ /^\+$/;

	my($readID) = $id1 =~ /^(\S+)/;
	my $len = length($seq);

	$readID =~ s/\@//;
	my $output = ">$readID\n$seq";

	print "$readID\t$len\n";

	open OUTF,">$readID.fasta";
	print OUTF $output;
	close OUTF;
}

