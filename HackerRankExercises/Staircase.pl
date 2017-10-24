#!/usr/bin/perl

=begin
Consider a staircase of size 4:

   #
  ##
 ###
####
Observe that its base and height are both equal to , and the image is drawn using # symbols and spaces.
The last line is not preceded by any spaces.

Write a program that prints a staircase of size .

INPUT FORMAT
A single integer, , denoting the size of the staircase.

OUTPUT FORMAT
Print a staircase of size  using # symbols and spaces.

Note: The last line must have  spaces in it.

Sample Input
6 

Sample Output

     #
    ##
   ###
  ####
 #####
######
=cut


$n = <STDIN>;
chomp $n;

my $i = 0;
while ($i < $n) {
    my @a_tmp;
    for (my $j = $n; $j > 0; $j--) {
        if ($j >= ($n - $i)) {
            unshift @a_tmp, '#';
        } else {
            unshift @a_tmp, ' ';
        }
    }
 
    $i++;
    foreach $i (@a_tmp) {
        print $i;
    }
    print "\n";
}