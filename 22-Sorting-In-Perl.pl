#!/usr/bin/perl

=begin
Perl has in build sort() function which sorts the array given to it.
This sorting is done on basis of ASCII table order and hence sort function has to be written differently.
=cut

use strict;
use warnings;
use Data::Dumper qw(Dumper);

# Proper sorting done as all are small chars
my @words = qw(foo bar zorg moo);
print Dumper \@words;				# prints array
my @sorted_words = sort @words;
print Dumper \@sorted_words;		# prints sorted array

# Now change zorg to Zorg
$words[2] = 'Zorg';
print Dumper \@words;
my @sorted_words_2 = sort @words;
# Here Zorg will be first element in sorted array because in ASCII table Capital letters come first followed by smaller letters.
# sort() function sorts based on ASCII order.
print Dumper \@sorted_words_2;

=begin
# Alternate way to sort alphabetically.
# Using comparison function (cmp).
The way sort works in Perl is that it goes over every two elements of the original array.
In every turn it puts the value from the left side into the variable $a, and the value on the right side in the variable $b.
Then it calls a comparison function. That "comparison function" will return 1 if the content of $a should be on the left,
-1 if the content of $b should be on the left, or 0 if it does not matter as the two values are the same.

By default you don't see this comparison function and sort compares the values according to the ASCII table, but if you want,
you can write it explicitly as follows
=cut
print "\n\USorting alphabetically:\n";
@sorted_words_2 = sort {lc($a) cmp lc($b)} @words;
print Dumper \@sorted_words_2;

# Simlar is the case with numeric array.
my @numbers = (14, 3, 12, 2, 23);
my @sorted_numbers = sort @numbers;

# The array is not sorted properly because perl considers aray element as string and hence in case of 12 and 3, "1" comes before "3"
# in ASCII table and hence 12 comes before 3 after sorting using just sort function.
print Dumper \@sorted_numbers;

# ALternate way o sort NUMERICALLY
@sorted_numbers = sort {$a <=> $b} @numbers;
print "\n\USorting Numerically:\n";
print Dumper \@sorted_numbers; 