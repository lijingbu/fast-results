#!/usr/bin/perl

my $usage = "seq ids out";
my @inputParameters = split /\s+/, $usage;
$usage_warning = $0;	$usage_warning =~ s/.*\\//; $usage_warning =~ s/.*\///;
my $usage_warning = "\n	Usage: perl $usage_warning <".(join "> <", @inputParameters).">\n\n";
unless ( $#inputParameters == $#ARGV )	{ die $usage_warning };
for (my $para_counts=0;$para_counts<=$#inputParameters;$para_counts++){	${$inputParameters[$para_counts]} = $ARGV[$para_counts];	}
##-------End of preparation.---------------------------------------------


my ($id, @ids, %seq);

open in, "$seq" or die "$seq $!\n";
while (my $line = <in>){
	chomp $line;
	if ($line =~ />(\S+)/){
		$id = $1;
	}else{
		$seq{$id} .= $line;
	}
}
close in;

open in, "$ids" or die "$ids $!\n";
open out, ">$out" or die "$out $!\n";
while (my $id = <in>){
	chomp $id;
	print out ">$id\n$seq{$id}\n";
}
close in;
close out;

