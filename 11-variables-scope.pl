#!/usr/bin/perl

#global variable, visible everywhere in the file
$string = "Hello World!!";

sub PrintHello {
	# local variables are visible to all the subroutines called from this subroutine
	local $string = "PrintHello(), Hello Perl!!";
	print $string, "\n";
	PrintAgain();
}

sub PrintAgain {
	print "PrintAgain(), $string\n";
}

PrintHello();
print "PrintGlobally(), $string\n\n";

use feature 'state';
sub PrintCounter {
	state $counter = 0;
	print "PrintCounter(), $counter\n";
	$counter++;
}
for (1..5) {
	PrintCounter();	
}
#counter will not be visible here, as it is private to subroutine PrintCounter() as it is declared as state
#print "PrintGlobally(), $counter\n";