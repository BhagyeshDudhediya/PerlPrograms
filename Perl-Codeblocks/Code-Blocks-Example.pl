#!/usr/bin/perl

use strict;
use warnings;

# This line is executed after compilation of entire file completes.
print "1st Print\n";
print "2nd Print\n";

=begin
Flow for above code goes as:
1. Compile the "First" print
2. Compile the BEGIN block
3. Execute the BEGIN block
4. Compile the "Second" print
5. Execute the "First" print
6. Execute the "Second" print
=cut

# The below statement fails at compile time, still error is thrown after BEGIN is executed as BEGIN is executed immeditely before entire file is
# compiled. Uncomment the follow. 2 lines and check.
# my $x = ;
# print "3rd Print\n";


print "10. Ordinary code runs at runtime.\n";
END {
	print "16. So this is the end of the tale.\n"
}
INIT {
	print "7. INIT blocks run FIFO just before runtime.\n"
}
UNITCHECK {
	print "4. And therefore before any CHECK blocks.\n"
}
CHECK {
	print "6. So this is the sixth line.\n"
}
print "11. It runs in order, of course.\n";
BEGIN {
	print "1. BEGIN blocks run FIFO during compilation.\n"
}
END {
	print "15. Read perlmod for the rest of the story.\n"
}
CHECK {
	print "5. CHECK blocks run LIFO after all compilation.\n"
}
INIT {
	print  "8. Run this again, using Perl's -c switch.\n"
}
print "12. This is anti-obfuscated code.\n";
END {
	print "14. END blocks run LIFO at quitting time.\n"
}
BEGIN {
	print "2. So this BEGIN line comes out second.\n"
}
UNITCHECK {
	print "3. UNITCHECK blocks run LIFO after each file is compiled.\n"
}
INIT {
	print "9. You'll see the difference right away.\n"
}
print "13. It only _looks_ like it should be confusing.\n";

=begin
Sequence in which code blocks are executed:

	CODEBLOCK		ORDER OF EXECUTION							WHEN
1. BEGIN 		:=		FIFO order 			Immediately as encountered (even before compilation of entire file)
2. UNITCHECK	:= 		LIFO order			After each file is compiled
3. CHECK		:= 		LIFO order			After all compilation
4. INIT			:= 		FIFO order			Just before runtime
5. Ordinary Code statements in code
6. END			:= 		LIFO				After execution of program and before exit of interpreter

=cut