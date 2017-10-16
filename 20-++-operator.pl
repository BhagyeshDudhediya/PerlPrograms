#!/usr/bin/perl

=begin
Although one might expect the auto-increment operator (++) to work only on numbers, Perl has a special use for the ++ operator on strings.

It takes the last character and increments it by one according to the ASCII table restricted to letters.
Either lower-case letter or upper-case letters. If we increment a string that ends with the letter 'y' it will change it to 'z'.
If the string ends with 'z' then an increment will will change it to be the letter 'a', but the letter to the left of it will be
incremented by one as well.

=cut

# It works good for numbers
$num = 6;
$num++;
print "Number=$num\n";		# prints 7

$str = "businessbay";
print "String Variable=$str\n";

# auto-increment $str
$str++;							# prints businessbay
print "After ++ = $str\n";		# prints businessbaz

# Now as last character is 'z', it changes to a and the letter to it's left will also be incremented by 1
$str++;
print "After one more ++ = $str\n";		# prints businessbba
$str++;
print "After one more ++ = $str\n";		# prints businessbbb

# Now use of -- operator on perl strings. It does not work.
$str--;									# prints -1
print "After -- operator = $str\n";
$str--;

$new_str = "ayy";
$new_str++;			# change to ayz
$new_str++;			# change to aza
$new_str++;			# change to azb
print "$new_str\n";