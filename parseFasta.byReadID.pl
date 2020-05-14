#!/usr/bin/perl

use strict;

my $reads = "
29264964-909f-4245-8557-2a1dec41c99d
040e6978-e15c-401a-9f71-b46859ec098e
3357cc77-07e6-4be0-a206-b093ad2a39ff
35a9c2dd-5ee5-4b03-b25c-de359aee1a04
a77bc536-c7c7-43a9-821a-9cb80b0da60b
32f5bd34-af3d-44b8-9de9-c191cea71354
47f70412-9bdb-4413-b987-8a9d70d46245
943e5ad9-e70c-4b78-a496-8352ac741143
9bcf9a03-aaa5-48f5-a308-a01a2e81fbb3
";

my %reads;
foreach my $bar (split /\n/, $reads) {
	chomp($bar);
	$reads{$bar} = 1;
}

open INF,"$ARGV[0]";
while (<INF>) {
	my $id1 = $_;
	my $seq = <INF>;

	next if $id1 =~ /^\+$/;

	my($readID) = $id1 =~ /^\@(\S+)/;
	my $len = length($seq);

	next unless $reads{$readID};
	print "$readID\t$len\n";
}
close INF;
