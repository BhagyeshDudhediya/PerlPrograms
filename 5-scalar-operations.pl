#!/usr/bin/perl

# String concatenation
$string = "Hello"." World!!";
print "$string\n";

# Append number to string
$str_num = $string.42;
print "$str_num\n";

print "This File=",__FILE__,"\n";
print "Line no.=",__LINE__," Package=".__PACKAGE__,"\n";