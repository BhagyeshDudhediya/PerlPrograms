#!/usr/bin/perl

=begin
Given an array of integers, calculate which fraction of its elements are positive, which fraction of its elements are negative,
and which fraction of its elements are zeroes, respectively. Print the decimal value of each fraction on a new line.

Note: This challenge introduces precision problems. The test cases are scaled to six decimal places, though answers with absolute error of
up to  are acceptable.

INPUT FORMAT
The first line contains an integer, , denoting the size of the array. 
The second line contains  space-separated integers describing an array of numbers .

OUTPUT FORMAT
You must print the following  lines:

A decimal representing of the fraction of positive numbers in the array compared to its size.
A decimal representing of the fraction of negative numbers in the array compared to its size.
A decimal representing of the fraction of zeroes in the array compared to its size.

Sample Input:
6
-4 3 -9 0 4 1

Sample Output:
0.500000
0.333333
0.166667  
=cut

$n = <STDIN>;
chomp $n;
$arr_temp = <STDIN>;
@arr = split / /,$arr_temp;
chomp @arr;

my $pos_num = 0;
my $neg_num = 0;
my $zeros = 0;

for $i (@arr) {
    if ($i > 0) {
        $pos_num++;
    } elsif ($i < 0) {
        $neg_num++;
    } else {
        $zeros++;
    }
}

print $pos_num/scalar @arr, "\n";
print $neg_num/scalar @arr, "\n";
print $zeros/scalar @arr, "\n";
