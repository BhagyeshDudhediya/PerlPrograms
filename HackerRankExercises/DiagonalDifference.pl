#!/usr/bin/perl

=begin
Given a square matrix of size , calculate the absolute difference between the sums of its diagonals.

INPUT FORMAT
The first line contains a single integer. The next  lines denote the matrix's rows, with each line containing space-separated integers
describing the columns.

CONSTRAINTS
-100 <= Elements in matrix <= 100

OUTPUT FORMAT
Print the absolute difference between the two sums of the matrix's diagonals as a single integer.

Sample Input
3
11 2 4
4 5 6
10 8 -12

Sample Output
15
=cut

$n = <STDIN>;
chomp $n;
$a_i = 0;
@a = ();
while($a_i < $n){
   my $a_temp = <STDIN>;
   my @a_t = split / /,$a_temp;
   chomp @a_t;
   push @a,\@a_t;
   $a_i++;
}

my $prim_sum = 0;
my $sec_sum = 0;
my $cnt = 0;
for ($i = 0; $i < $n; $i++) {
    for ($j = 0; $j < $n; $j++) {
        if ($i == $j) {
            $prim_sum += $a[$i][$j];
        }
        if ($j == ($n - $i - 1)) {
            $sec_sum += $a[$i][$j];
        }
    }
}

print abs($prim_sum - $sec_sum);