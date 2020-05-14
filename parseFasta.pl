#!/usr/bin/perl

use strict;

while (<>) {
	my $id1 = $_;
	my $seq = <>;

	next if $id1 =~ /^\+$/;

	my($readID) = $id1 =~ /^(\S+)/;
	my $len = length($seq);

	print "$readID\t$len\n";
}

