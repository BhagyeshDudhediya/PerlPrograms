#!/usr/bin/perl

=begin
Consider an array of  integers, , where all but one of the integers occur in pairs.
In other words, every element in  occurs exactly twice except for one unique element.

Given A, find and print the unique element.

INPUT FORMAT
The first line contains a single integer, , denoting the number of integers in the array. 
The second line contains  space-separated integers describing the respective values in .

OUTPUT FORMAT
Print the unique number that occurs only once in  on a new line.

Sample Input
1
1
Sample Output
1
=cut

sub lonelyinteger {
    my (@arr) = @_;
  
    if ($#arr == 0) {
        return $arr[0];
    }
    
    my $xor = $arr[0];
    for ($i = 1; $i <= $#arr; $i++) {
    	
    	# XORing elements from array considers every element as string and hence we need to typecast it to int.
        $xor = int($xor)^int($arr[$i]);
    }
    
    return $xor;
}

$n = <STDIN>;
chomp $n;
$a_temp = <STDIN>;
@a = split / /,$a_temp;
chomp @a;
$result = lonelyinteger(@a);
print "$result\n";