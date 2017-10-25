#!/usr/bin/perl

sub divisibleSumPairs {
    my ($num_elems, $k, @arr) = @_;
    my $count = 0;
    for ($i = 0; $i < $#arr; $i++) {
        if (($arr[$i] + $arr[$i+1] % $k) == 0) {
            $count++;
        }
    }
    
    return $count;
}

$n_temp = <STDIN>;
@n_arr = split / /,$n_temp;
$n = $n_arr[0]; 
chomp $n;
$k = $n_arr[1];
chomp $k;
$ar_temp = <STDIN>;
@ar = split / /,$ar_temp;
chomp @ar;
$result = divisibleSumPairs($n, $k, @ar);
print "$result\n";