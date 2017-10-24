#!/usr/bin/perl

=begin
Two cats named  and  are standing at integral points on the x-axis. Cat  is standing at point  and cat  is standing at point . Both cats run at the same speed, and they want to catch a mouse named  that's hiding at integral point  on the x-axis. Can you determine who will catch the mouse?

You are given  queries in the form of , , and . For each query, print the appropriate answer on a new line:

If cat  catches the mouse first, print Cat A.
If cat  catches the mouse first, print Cat B.
If both cats reach the mouse at the same time, print Mouse C as the two cats fight and mouse escapes.

INPUT FORMAT
The first line contains a single integer, , denoting the number of queries. 
Each of the  subsequent lines contains three space-separated integers describing the respective values of  x(cat A's location), 
y(cat B's location), and  z(mouse C's location).

OUTPUT FORMAT
On a new line for each query, print Cat A if cat  catches the mouse first, Cat B if cat  catches the mouse first,
or Mouse C if the mouse escapes.

Sample Input
3
1 2 3
1 3 2
2 1 3

Sample Output
Cat B
Mouse C
Cat A
=cut

$q = <STDIN>;
chomp $q;
for my $a0 (0..$q-1){
    $x_temp = <STDIN>;
    @x_arr = split / /,$x_temp;
    $x = $x_arr[0];
    chomp $x; 
    $y = $x_arr[1];
    chomp $y;
    $z = $x_arr[2];
    chomp $z;
    my $cat_a = abs($z - $x);
    my $cat_b = abs($z - $y);
    if ($cat_a < $cat_b) {
        print "Cat A\n";
    } elsif ($cat_a > $cat_b) {
        print "Cat B\n";
    } elsif($cat_a == $cat_b) {
        print "Mouse C\n";
    }
}
