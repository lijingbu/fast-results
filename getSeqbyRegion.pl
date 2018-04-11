#!/usr/bin/perl

my $usage = "genome regions     out";
my @inputParameters = split /\s+/, $usage;
$usage_warning = $0;    $usage_warning =~ s/.*\\//; $usage_warning =~ s/.*\///;
my $usage_warning = "\n Usage: perl $usage_warning <".(join "> <", @inputParameters).">

regions format:
chromosome  start stop  strand  sequenceName

output format:
>sequenceName chromosome_start_stop_strand_length
MAGNSDNEIGNDMNMDNSD.....Sequences..
\n\n";
unless ( $#inputParameters == $#ARGV )  { die $usage_warning };
for (my $para_counts=0;$para_counts<=$#inputParameters;$para_counts++){ ${$inputParameters[$para_counts]} = $ARGV[$para_counts];        }
##-------End of preparation.---------------------------------------------

my %seq;
open in, "$genome" or die "$genome $!\n";
my $id;
while (my $line = <in>){
        chomp $line;
        if ($line =~ /^>(\S+)/){
                $id = $1;
        }else{
                $seq{$id} .= $line;
        }

}
close in;

open in, "$regions" or die "$regions $!\n";
open out, ">$out" or die "$out $!\n";

while (my $line = <in>){
        chomp $line;
        my ($chr, $start, $stop, $strand, $name) = split /\t/, $line;
        my $length = $stop - $start + 1;
        my $outinf = join "_", ($chr, $start, $stop, $strand);
        my $outseq = substr $seq{$chr}, $start-1, $length;
        print join "\t", ($chr, "Start=", $start-1, "End=", $stop, "length=", $length);
        print "\n";
        if ($strand eq "-"){
                print "Negative strand.\n";
                $outseq = reverse($outseq);
                $outseq =~ tr/ABCDGHMNRSTUVWXYabcdghmnrstuvwxy/TVGHCDKNYSAABWXRtvghcdknysaabwxr/;
        }
        print out ">$name $outinf\n$outseq\n";
}
close in;
close out;
