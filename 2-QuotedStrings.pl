#!/usr/bin/perl

# Difference between Single Quote and Double Quote
print "Hello World\n";
print 'Hello World\n';

print "\n";

$var=10;
print "Value of var=$var\n";
print 'Value of var=$var\n';

=begin
The "Here" document also works in perl, but varies with single and double quote
as above. Interpolation is done in double quotes and not in single quotes
=cut

$a=10;
$my_var = << "EOF";
This is the syntax for here document and it will continue
until it encounters a EOF in the first line.
This is case of double quote so variable value will be 
interpolated. For example value of a = $a
EOF
print "\nValue of my-var in double quotes:\n $my_var \n";

$my_var = << 'EOF';
This is the syntax for here document and it will continue
until it encounters a EOF in the first line.
This is case of single quote so variable value will not be 
interpolated. For example value of a = $a
EOF
print "Value of my-var in single quotes:\n $my_var \n";