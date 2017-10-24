#!/usr/bin/perl

=begin
Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers.
Then print the respective minimum and maximum values as a single line of two space-separated long integers.

INPUT FORMAT
A single line of five space-separated integers.

OUTPUT FORMAT
Print two space-separated long integers denoting the respective minimum and maximum values that can be calculated by summing exactly
four of the five integers. (The output can be greater than 32 bit integer.)

Sample Input
1 2 3 4 5

Sample Output
10 14
=cut

$arr_temp = <STDIN>;
@arr = split / /,$arr_temp;
chomp @arr;

my $min = 0;
my $max = 0;
for ($i = 0; $i < scalar @arr; $i++) {
    my $sum = 0;
    for ($j = 0; $j < scalar @arr; $j++) {
        if ($i == $j) {
            next;
        }
        $sum += $arr[$j];
    }
    if ($i == 0) {
        $max = $min = $sum;
    } elsif ($sum > $max) {
        $max = $sum;
    } elsif ($sum < $min) {
        $min = $sum;
    }
}

print $min, " ", $max;