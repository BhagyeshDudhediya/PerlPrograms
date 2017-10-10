#!/usr/bin/perl
use strict;
use warnings;

##### SCALARS #####
print "SCALAR VARIABLES\n";
my $name = "Bhagyesh";
print "Original name: $name\n";

$name="New-name";
# New format of print
print "Changed name: ", $name, "\n";

# Print perl version
print "Perl Version: ", $], "\n";

##### ARRAYS #####
print "\nARRAY VARIABLES\n";
my @animals = ("camel", "dog", "cat");
my @numbers = (21, 42, 63, 84);
my @mix = ("camel", 32, 1.256, 'a');

print "Number of animals Elements: ", $#animals + 1, "\n"; 
print "1st Element: ", $animals[0], "\n";
print "Last Element", $animals[$#animals], "\n";
print "\n";
# Array Slice 
print "Entire array: ", @animals[0..$#animals], "\n";
print "First 2 elements: ", @animals[0..1], "\n";

print $mix[$#mix], "\n";
print "\n";
# Manipulate arrays
my @sorted_animals = sort @animals;
print "Original animals: @animals[0..$#animals]\n";
print "Sorted animals: @sorted_animals[0..$#sorted_animals]\n";
print "\n";
my @sorted_mix = sort @mix;
print "Original mix: ", @mix[0..$#mix], "\n";
print "Sorted mix: @sorted_mix[0..$#sorted_mix]\n";

print "\n";
#### VARIABLE CONTEXT ####
my @animals_copy = @animals;     # Here animals is copied to another array, so context is assumed as array
my $animals_size = @animals;	 # Here animals is copied to scalar, so context is assumed to be scalar

print "Copied animals=@animals_copy \n";
print "Size of animals array=$animals_size\n";