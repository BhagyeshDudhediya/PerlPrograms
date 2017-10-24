#!/usr/bin/perl

=begin
Given two integers, L and R, find the maximal value of A xor B, where  and  satisfy the following condition:
L <= A <= B <= R

INPUT FORMAT
The input contains two lines; L is present in the first line and R in the second line.

OUTPUT FORMAT
The maximal value as mentioned in the problem statement.

Sample Input
10
15

Sample Output
7
=cut

sub maxXor{
    my ($l, $r) = @_;
    
    my $max_xor = 0;
    for ($i = 0; $l + $i <= $r; $i++) {
        $xor = int($l) ^ int($l+$i);
        $max_xor = ($xor > $max_xor) ? $xor : $max_xor;
        if ($l + $i == $r) {
            $l++;
            $i = 0;
        }
    }
    
    return $max_xor;
}

$_l = <STDIN>;
chomp $_l;

$_r = <STDIN>;
chomp $_r;

$res = maxXor($_l, $_r);
print "$res\n";