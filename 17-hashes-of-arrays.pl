#!/usr/bin/perl

#####################################
## Create and access hashes of arrays
#####################################
%HoA = (
	names => [ "John", "George", "Jolie"],
	city => ["NewYork", "Sydney", "Moscow"],
	country => ["USA", "Australia", "Russia"],
);

print "\$HoA{names}[2] => ", $HoA{names}[2], "\n";		# prints Jolie
# Print every element in keys country
print "\nHASH ELEMENTS:\n";
print "\n\UMethod 1:\n";
foreach $item (keys %HoA) {
	print "KEY => ", $item, "\n";
	for $i (0..$#{$HoA{$item}}) {
		print "\%HoA{$item}[$i] => ", $HoA{$item}[$i], "\n";
	}
}

print "\n\UMethod 2:\n";
for $item (keys %HoA) {
	print "\%HoA{$item} => ", @{$HoA{$item}}, "\n";
}

print "\n\UMethod 3:\n";
# Print by sorting based on keys
for $item (sort keys %HoA) {
	print "KEY => $item \tVALUES => ", @{$HoA{$item}}, "\n";
}

# Print each row sorted by value
print "\n\UMethod 4:\n";
for $item (keys %HoA) {
	print "Before sorting $item: ", @{$HoA{$item}}, "\n";
	print "After sorting $item: ", (sort @{$HoA{$item}}), "\n";
	print "\n"; 
}

#####################################
## Add new arrays to hash
#####################################
print "\n\UManipulating hash of arrays:\n";
$HoA{gender} = ["male", "male", "female"];
print "\%HoA[gender] => ", @{$HoA{gender}}, "\n\n";
push @{$HoA{age}}, 24, 35, 21;
foreach $key (keys %HoA) {
	print "\UKey => $key \UValues => ", @{$HoA{$key}}, "\n";
}