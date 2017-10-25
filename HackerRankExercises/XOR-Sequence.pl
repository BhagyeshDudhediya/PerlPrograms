#!/usr/bin/perl

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
    #open (FILE, ">data.txt");
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
