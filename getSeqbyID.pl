#!/usr/bin/perl

my $usage = "seq ids out";
my @inputParameters = split /\s+/, $usage;
$usage_warning = $0;    $usage_warning =~ s/.*\\//; $usage_warning =~ s/.*\///;
my $usage_warning = "\n Usage: perl $usage_warning <".(join "> <", @inputParameters).">\n\n";
unless ( $#inputParameters == $#ARGV )  { die $usage_warning };
for (my $para_counts=0;$para_counts<=$#inputParameters;$para_counts++){ ${$inputParameters[$para_counts]} = $ARGV[$para_counts];        }
##-------End of preparation.---------------------------------------------


my ($id, @ids, %seq, %id2annt);

open in, "$seq" or die "$seq $!\n";
while (my $line = <in>){
        chomp $line;
        if ($line =~ />(\S+)/){
                $id = $1;
                $id2annt{$id} = $line;
        }else{
                $seq{$id} .= $line;
        }
}
close in;

my $n=0;
my $m=0;
open in, "$ids" or die "$ids $!\n";
open out, ">$out" or die "$out $!\n";
while (my $id = <in>){
        chomp $id;
        if(exists($seq{$id})){
                $n++;
                print out "$id2annt{$id}\n$seq{$id}\n";
        }else{
                $m++;
                warn "$id not found\n";
        }
}
close in;
close out;

print "Extracted $n sequences, and $m sequences missing.\n"
