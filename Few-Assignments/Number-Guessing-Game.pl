#!/usr/bin/perl

=begin
A game for user to try his luck and guess the randomly generated numeric number by the program.
This covers few numeric functions such as:
1. looks_like_number($num) - To check if given number, $num, is a numeric value.
2. rand($num) - Generate a random number in the range 0 to $num, including 0 and excluding $num
3. int $number - Get the integer equivalent of the given number.
=cut

use strict;
use warnings;

# looks_like_number() checks if he given number is a number or not
use Scalar::Util qw(looks_like_number);

# Generate a random number between 0 and 200 (including 0, excluding 200). It can be decimal no. or integer no.
my $generated_num = rand(200);

# If a invalid number entered, come back here to re-eneter it
INPUT: print "Enter your number between 0 and 200..\n";
my $user_num = <STDIN>;

# STDIN has new-line(\n) appended to it, remove that new-line character from input
chomp $user_num;

# Check if user_number is a valid numeric number or not
if (!looks_like_number($user_num)) {
	print "Please enter a numeric number between 0 and 200\n";
	goto INPUT;
}

# Now as input is numeric check if it's in the range
if ($user_num >= 200 or $user_num < 0) {
	print "Invalid number entered..Please enter a number in the range\n";
	goto INPUT;
}

# Get the integer equivalent of generated random number
$generated_num = int $generated_num;		# Same as $generated_num = int($generated_num);

if ($generated_num > $user_num) {
	print "Oops..you entered a lesser number..\nGenerated random number=$generated_num\n";
} elsif($generated_num < $user_num) {
	print "Oops..you entered a greater number..\nGenerated random number=$generated_num\n";
} else {
	print "Bingo!! You got it..!!!\n";
}
