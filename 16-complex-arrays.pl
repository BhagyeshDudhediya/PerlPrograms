#!/usr/bin/perl

# In perl scalars, arrays and scalars are basic data strucures using which we can create complex data structures as well like stack,
# queue, trees, etc

=begin
In Perl, even "multidimensional" arrays are actually one-dimensional, but the values along that dimension are references to other arrays,
which collapse many elements into one.
If you print these values out without dereferencing them, you will get the stringified references rather than the data you want.
For example, these two lines:

@AoA = ( [2, 3], [4, 5, 7], [0] );
print "@AoA";
result in something like:

ARRAY(0x83c38) ARRAY(0x8b194) ARRAY(0x8b1d0)
=cut

########################################
## CREATE AND ACCESS ARRAY
########################################

# Create a 2D Array
@AoA = (
	["John", "Jolie", "Ken"],
	["Javie", "George", "Fred"],
	["Home", "Office"],
);
# You can access elements directly as:
print "\$AoA[0][1] => ", $AoA[0][1], "\n";		# prints Jolie
print "\$AoA[2][1] => ", $AoA[2][1], "\n";		# prints Office

# Create reference for ArrayofArray
$AoA = [
	["John", "Jolie", "Ken"],
	["Javie", "George", "Fred"],
	["Home", "Office"],
];
print "\n\UAccess using references..\n";
print "\$\$AoA[0]->[1] => ", $$AoA[0]->[1], "\n";		# prints Jolie
print "\$AoA->[0][1] => ", $AoA->[0][1], "\n"; 			# prints Jolie again
print "\$AoA->[0]->[1] => ", $AoA->[0]->[1], "\n"; 		# prints Jolie once again

# $#array - gives largest index in array, $array[-1] indiactes first element from end of array
print "\$AoA->[\$-#AoA-1]->[-2] => ", $AoA->[-$#AoA-1]->[-2], "\n";	# prints Jolie (from end of array as -ve index used)

$ref_to_array = \@AoA;
print "\$ref_to_array->[0][1] => ", $ref_to_array->[0][1], "\n";	# prints Jolie

########################################
## MANIPULATING ARRAY
########################################

print "\n\UManipulate arrays\n";
# Adding new rows to a array
print "Last index in array: $#AoA\n";			# prints 2
push @{ $AoA[3] }, "Banana", "Apple";
print "\$AoA[3][0] => ", $AoA[3][0], "\n";		# prints Banana

# Adding new columns to existing rows
print "Last index in row 3: $#{$AoA[3]}\n";		# prints 1
push @{ $AoA[3] }, "Mango", "Pineapple";
print "\$AoA[3][3] => ", $AoA[3][3], "\n";		# prints Pineapple
print "Last index in row 3: $#{$AoA[3]}\n";		# prints 3

########################################
## CREATE SLICE OF AN ARRAY
########################################
print "\n\USLICE OF ARRAY\n";
@part_of_AoA = @{$AoA[3]} [0..1];
print "Slice of \$AoA[3] => ", @part_of_AoA, "\n";

@part_of_AoA_2 = ();
for $i (1..3) {
	push @part_of_AoA_2, $AoA[3][$i];
}
print "More slice of \$AoA[3] => ", @part_of_AoA_2, "\n";

# Create 2x2 slice of Array of Array
@newAoA = ();
for ($startx = $x = 1; $x < 3; $x++) {
	for ($starty = $y = 1; $y < 3; $y++) {
		$newAoA[$x - $startx][$y - $starty] = $AoA[$x][$y];
	}
}
print "New Slice of AoA, \$newAoA[0][1] => ", $newAoA[0][1], "\n";	# prints Fred

# Another optimised way to create 2D slice of AoA
@newAoA_2 = ();
for ($x = 1; $x < 3; $x++) {
	push @newAoA_2, [ @{$AoA[$x]} [1..2] ];
}
print "New Slice of AoA, \$newAoA_2[0][1] => ", $newAoA_2[0][1], "\n";	# prints Fred
	
=begin	
Creating multi dimensional array:
1. $AoA[$i] = [ @array ];   		# Safest, sometimes fastest
2. $AoA[$i] = \@array;      		# Fast but risky, depends on my-ness of array
3. @{ $AoA[$i] } = @array;  		# A bit tricky

Examples:
1. for $i (1..10) {
    	@array = somefunc($i);
    	$AoA[$i] = [ @array ];   # RIGHT! and not $AoA[$i] = \@array (because @array is not declared with my)
	}
2. for $i (1..10) {
    	my @array = somefunc($i); (If my not used then we get same address for diff arrays returned by func. Hence AoA contains references for same array)
    	$AoA[$i] = \@array;
	}
3. for $i (1..10) {
    	@array = somefunc($i);
    	@{$AoA[$i]} = @array;
	}
=cut