#!/usr/bin/perl

=begin
Colleen is turning  years old! Therefore, she has  candles of various heights on her cake, and candle  has height .
Because the taller candles tower over the shorter ones, Colleen can only blow out the tallest candles.

Given for each individual candle, find and print the number of candles she can successfully blow out.

INPUT FORMAT

The first line contains a single integer, , denoting the number of candles on the cake. 
The second line contains  space-separated integers, where each integer  describes the height of candle .

OUTPUT FORMAT
Print the number of candles Colleen blows out on a new line.

Sample Input
4
3 2 1 3

Sample Output
2
=cut

sub birthdayCakeCandles {
    my $age = shift;
    my @candles = @_;
    
    my %hash;
    foreach $i (@candles) {
        if (exists($hash{$i})) {
            $hash{"$i"} = ++$hash{"$i"};
        } else {
            $hash{"$i"} = 1;
        }
    }
    
    my @values = values %hash;
    
    @values = sort {$a <=> $b} @values;
  
    return $values[$#values];
}

$n = <STDIN>;
chomp $n;
$ar_temp = <STDIN>;
@ar = split / /,$ar_temp;
chomp @ar;
$result = birthdayCakeCandles($n, @ar);
print "$result\n";

