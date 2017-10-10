#!/usr/bin/perl
use Switch;

$var = 10;
@array = (10, 20, 30);
%hash = ('key1' => 10, 'key2' => 20);

switch ($var) {
	case 10 			{
							print "Var is number. \$var=$var\n";
							next;
						}
	case "a" 			{print "string a\n"; next;}
	case 'b'			{print "char b\n";}
	case [1..10, 42]	{print "Number in list\n";next;}
	case (\@array)		{print "Number in array\n";next;}
	case (\%hash)		{print "Number in hash\n";}
	else 				{print "Invalid number\n";}
}