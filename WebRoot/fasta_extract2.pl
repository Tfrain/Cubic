#perl fasta_extract2.pl v3.25 1 0 200 region.fasta
die "usage: perl $0 in1 in2  in3 in4 in5 out\n", if (@ARGV != 5);
my $fastaFile=shift;
my $chr=shift;
my $start=shift;
my $end=shift;
my $out=shift;

my $header;
my $seq = "";
my %seq;

open OUT, ">$out";
open IN1, "chr${chr}_${fastaFile}.fa" or die "Cannot find the specified fasta file ";
	 while (<IN1>){
		chomp;s/\r//g;
		@fa=split(/\t/,$_);
		my $seq = $fa[1];
		$sta=$start-1;$length=$end-$start+1;$id=join("_",$chr,$start,$end);
		my $part = substr($seq,$sta,$length);
		print OUT "SEQUENCE=$part\n";
	}
close IN1;
close IN;
close OUT;
