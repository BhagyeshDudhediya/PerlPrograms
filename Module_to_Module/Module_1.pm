#!/usr/bin/perl

package Module_1;

use Exporter qw(import);
our @EXPORT = qw(is_odd);

sub is_odd {
	$num = @_;
	if ($num %2 != 0) {
		return 1;
	}
	
	return 0;
}

sub is_prime {
	$num = shift;
	if ($num == 2) {
		return 1;
	} else {
		for ($iter = 2; $iter < $num; $iter++) {
			if (($num % $iter) == 0) {
				# Number is not prime
				return 0;
			}
		}
	}
	
	# Number is prime
	return 1;
}

1;