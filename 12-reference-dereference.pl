#!/usr/bin/perl

$var = 10;
$scalarRef = \$var;
print "Value of variable=$$scalarRef\n";

$arrayRef = [1,2,3,4];
print "\nArray=@$arrayRef\n";
@newArray = ('a', 'b', 'c', 'd');
$newArrayRef = \@newArray;
print "New Array=@$newArrayRef\n";

$hashRef = {
	'key1' => 'value1',
	'key2' => 'value2',
};
print "\nHash=", %$hashRef, "\n";
%hash = ('key1' => 'val1', 'key2' => 'val2');
$newHashRef = \%hash;
print "New Hash=", %$newHashRef, "\n";

sub PrintHello {
	printf "\nPrinting using func reference: Hello Bhagyesh!!\n";
}
$funcRef = \&PrintHello;
&$funcRef;

$funcRef2 = sub { print "Shortcut for func ref done..\n"; };
&$funcRef2;