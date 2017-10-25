#!/usr/bin/perl

=begin
Louise and Richard play a game. They have a counter set to N. In every game, Louise gets the first turn and the turns alternate thereafter.
In the game, they perform the following operations.

If N is not a power of , reduce the counter by the largest power of 2 less than N.
If  is a power of , reduce the counter by half of N.
The resultant value is the new  which is again used for subsequent operations.
The game ends when the counter reduces to 1, i.e., N==1, and the last person to make a valid move wins.

Given N, your task is to find the winner of the game.

Update If they set counter to 1, Richard wins, because its Louise' turn and she cannot make a move.

INPUT FORMAT:
The first line contains an integer T, the number of testcases. 
lines follow. Each line contains N, the initial number set in the counter.

OUTPUT FORMAT:
For each test case, print the winner's name in a new line. So if Louise wins the game, print "Louise". Otherwise, print "Richard". 

Sample Input
1
6

Sample Output
Richard
=cut


my $T = <STDIN>;
chomp $T;

my $i = 0;
while ($i < $T) {
	my $turn = 0;

    my $N = <STDIN>; chomp $N;
    while ($N != 1) {
        if (($N & ($N-1)) == 0) {
            $N = $N/2;
        } else {
            my $tmp = $N;
            my $cnt = 0;
            
            # Get the power closet to this $N and subtract it from $N
            while ($tmp != 0) {
                $tmp = $tmp >> 1;
                $cnt++;
            }
            $N = $N - 2**(--$cnt);
        }
        $turn++;
        $turn = $turn % 2;
    }
    
    if ($turn == 1) {
        print "Louise\n";
    } else {
        print "Richard\n";
    }
    
    $i++;   
}