#
# read one line from a file, then convert it to protein. write it to a file.
#

open(INPUT_DATA,"<","dnafile.txt") or Die ("cannot open file");  #data is read one line at once from a file.
$line = <INPUT_DATA>;  #one line is read
chomp($line);  #newline character is removed.

close(DATA);

$DNA = $line;   

print "Original DNA : \n";
#$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';
print $DNA, "\n";

$DNA_2 = $DNA;
$DNA_2 =~ tr/ACGT/TGCA/;

print "Converted DNA : \n";
print $DNA_2, "\n";

$RNA = $DNA_2;
$RNA =~ s/T/U/g;

print "RNA : \n";
print $RNA, "\n";

my(%genetic_code) = (
  'UCA' => 'S', # Serine
  'UCC' => 'S', # Serine
  'UCG' => 'S', # Serine
  'UCU' => 'S', # Serine
  'UUC' => 'F', # Phenylalanine
  'UUU' => 'F', # Phenylalanine
  'UUA' => 'L', # Leucine
  'UUG' => 'L', # Leucine
  'UAC' => 'Y', # Tyrosine
  'UAU' => 'Y', # Tyrosine
  'UAA' => '_', # Stop
  'UAG' => '_', # Stop
  'UGC' => 'C', # Cysteine
  'UGU' => 'C', # Cysteine
  'UGA' => '_', # Stop
  'UGG' => 'W', # Tryptophan
  'CUA' => 'L', # Leucine
  'CUC' => 'L', # Leucine
  'CUG' => 'L', # Leucine
  'CUU' => 'L', # Leucine
  'CCA' => 'P', # Proline
  'CAU' => 'H', # Histidine
  'CAA' => 'Q', # Glutamine
  'CAG' => 'Q', # Glutamine
  'CGA' => 'R', # Arginine
  'CGC' => 'R', # Arginine
  'CGG' => 'R', # Arginine
  'CGU' => 'R', # Arginine
  'AUA' => 'I', # Isoleucine
  'AUC' => 'I', # Isoleucine
  'AUU' => 'I', # Isoleucine
  'AUG' => 'M', # Methionine
  'ACA' => 'T', # Threonine
  'ACC' => 'T', # Threonine
  'ACG' => 'T', # Threonine
  'ACU' => 'T', # Threonine
  'AAC' => 'N', # Asparagine
  'AAU' => 'N', # Asparagine
  'AAA' => 'K', # Lysine
  'AAG' => 'K', # Lysine
  'AGC' => 'S', # Serine
  'AGU' => 'S', # Serine
  'AGA' => 'R', # Arginine
  'AGG' => 'R', # Arginine
  'CCC' => 'P', # Proline
  'CCG' => 'P', # Proline
  'CCU' => 'P', # Proline
  'CAC' => 'H', # Histidine
  'GUA' => 'V', # Valine
  'GUC' => 'V', # Valine
  'GUG' => 'V', # Valine
  'GUU' => 'V', # Valine
  'GCA' => 'A', # Alanine
  'GCC' => 'A', # Alanine
  'GCG' => 'A', # Alanine
  'GCU' => 'A', # Alanine
  'GAC' => 'D', # Aspartic Acid
  'GAU' => 'D', # Aspartic Acid
  'GAA' => 'E', # Glutamic Acid
  'GAG' => 'E', # Glutamic Acid
  'GGA' => 'G', # Glycine
  'GGC' => 'G', # Glycine
  'GGG' => 'G', # Glycine
  'GGU' => 'G'  # Glycine
);



($protein) = "";
for($i=0; $i<length($RNA)-2; $i+=3){
  $x = substr($RNA,$i,3);                # substr -> takes characters out of a string
  $protein .= $genetic_code{$x};         # concatenation
}

print "protein : \n";
print $protein, "\n";


open(OUT,">","proteinfile.txt") or Die ("cannot open file while writing to the file");  #write a file
print OUT $protein;
close(OUT);