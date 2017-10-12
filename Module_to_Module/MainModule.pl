#!/usr/bin/perl

require Module_1;

# Use the exported function in module Module_1
use Module_1 qw(is_odd);

$number = 15;

sub is_palindrome {
	$str = $_[0];
	return ($str eq reverse $str);
}

# is_odd() is exported by Module_1 and hence can be used here
if (is_odd($number)) {
	print "$number is Odd\n";
} else {
	print "$number is Even\n";
}

# is_prime() is not exported here, hence should be called with scope resolution operator(::)
if (Module_1::is_prime($number)) {
	print "$number is Prime\n";
} else {
	print "$number is Not Prime\n";
}

# Calling function of this module itself
$name = "madam";
if (is_palindrome($name)) {
	print "$name is a Palindrome string\n";
} else {
	print "$name is not a Palindrome string\n";
}