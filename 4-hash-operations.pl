#/usr/bin/perl

##### HASH VARIABLES, KEY-VALUE PAIR #####
%fruit_color = ("apple", "red", "mango", "yellow", "strawberry", "pink");
print "Apple is: ", $fruit_color{"apple"}, "\n";

@fruits = keys %fruit_color;
print @fruits[0..$#fruits], "\n";

@colors = values %fruit_color;
print "\n", @colors[0..$#colors], "\n";

# Add element to hash
$fruit_color{'Guava'} = 'Green';
print "New hash Guava=$fruit_color{'Guava'}\n";

# Check if custard-apple exists in hash
if ( exists($fruit_color{"Custard-apple"}) ) {
	print "Custard-Apple = $fruit_color{'Custard-Apple'}\n";
}
else {
	print "Custard Apple not in hash\n";
}
@fruits = keys %fruit_color;
$size=@fruits;
print "Hash size before=$size\n";
delete($fruit_color{'apple'});
@fruits = keys %fruit_color;
$size=@fruits;
print "Hash size after delete=$size\n";