#!/usr/bin/perl

=begin
An array, , is defined as follows:
A[0] = 0
A[x]=A[x-1] xor [x], for x>0

You must answer Q questions. Each ith question, is in the form Li Ri, and the answer is A[Li] xor A[Li+1] xor ... xor A[Ri-1] xor A[Ri] 
(the Xor-Sum of segment [Li, Ri]).

Print the answer to each question.

INPUT FORMAT
The first line contains Q (the number of questions).
The  subsequent lines each contain two space separated integers, L and R, respectively. Line contains Li and Ri.

OUTPUT FORMAT
On a new line for each test case i, print the exclusive-or of A's elements in the inclusive range between indices Li and Ri.

Sample Input
3
2 4
2 8
5 9
Sample Output
7
9
15
=cut

$Q = <STDIN>;
chomp $Q;

my @A;
$A[0] = 0;
for my $a0 (0..$Q-1){
    $L_temp = <STDIN>;
    @L_arr = split / /,$L_temp;
    $L = $L_arr[0]; 
    chomp $L;
    $R = $L_arr[1];
    chomp $R;
    
    # If array does not have sufficient elements, add elements to it.
    # Following is property of such an array created, you can try it manually and check.
    if ((scalar @A)-1 < $R) {
    	my $i = scalar @A;
    	while ($i <= $R) {
    		if($i%4 == 0) {
    			$A[$i] = $i;
    		} elsif ($i%4 == 1) {
    			$A[$i] = 1;
    		} elsif ($i%4 == 2) {
    			$A[$i] = $i+1;
    		} elsif ($i%4 == 3) {
    			$A[$i] = 0;
    		}
    		
    		$i++;
    	}
    }
    $xor_sum = 0;
    for ($i = $L; $i <= $R; $i++) {
    	if ($i%4 == 0 and ($R - $i) >= 8) {
    		$i += 8;	
    	}
    	$xor_sum = ($xor_sum ^ (int($A[$i])));
    }
    
    print $xor_sum;
}
