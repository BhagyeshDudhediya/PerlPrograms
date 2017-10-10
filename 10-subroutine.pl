#!/usr/bin/perl

# Subroutine with no arguments
# Calling it before it's definition works as well
hello();
sub hello {
	print "Subroutine called, Hello World!\n";
}
hello();

sub average {
	$num = scalar @_;
	$sum = 0;
	foreach $var (@_) {
		$sum += $var;
	}
	return $sum/$num;
}

@list = (1..10);
$avg = average(@list);
print "Sum=$sum\tAverage=$avg\n";
print "Average=", average(1..20), "\n";
print "Sum=$sum\n";
print "Average=", average(10, 20, 30), "\n";
print "Sum=$sum\n";