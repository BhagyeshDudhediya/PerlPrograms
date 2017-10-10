#!/usr/bin/perl

$var1 = 10;
$var2 = 20;
if ($var1 < $var2) {
	print "\$var1 < \$var2\n";
} elsif($var1 > $var2) {
	print "\$var1 > \$var2\n";
} else {
	print "\$var1 == \$var2\n";
}

# if: the statements in if block executes if the given condition is false
# unless: the statements in unless block executes if the given condition is false
$my_str = "Bhagyesh";
unless ($my_str) {
	print "\$my_str has no value\n";
} else {
	print "\$my_str has value=$my_str\n"
}

if (!$my_str) {
	print "\$my_str has no value\n";
} else {
	print "\$my_str has value=$my_str\n";
}

# Smaller if-else statment
$age=60;
$status = ($age > 58) ? "Retired Person" : "Not Retired..";
print "\nStatus=$status, Age=$age\n";