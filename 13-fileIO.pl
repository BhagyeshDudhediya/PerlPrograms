#!/usr/bin/perl

open(DATA, "<1-hello-world.pl") or die "Couldn't open file !!";

# Read single line from file, scalar($) context
$line = <DATA>;
print "Scalar context for read:\n$line\n";
@lines = <DATA>;
print "Array context for read:\n@lines\n";

seek(DATA, 0, 0);
# Copy from one file to other for read+write
open(DST, "+>copied-file") or die "Couldn't open file to write..";
while(<DATA>) {
	print DST $_;
}

seek(DST, 0, 0);
# Read first 10 chars from file
read(DST, $line1, 10, 0);
print "\n\nREAD CHARS FROM FILE:\n$line1\n";

# Other way (one line code) to read an entire file. This is called slurp mode.
# The $/ variable is the Input Record Separator in Perl. When we put the read-line operator in scalar context,
# for example by assigning to a scalar variable $data = <DST>, perl will read from the file up-to and including the Input Record Separator which is,
# by default, the new-line \n.
# What we did here is we assigned undef to $/. So the read-line operator will read the file up-till the first time it encounters undef in the file.
# That never happens so it reads till the end of the file. This is what is called slurp mode, because of the sound the file makes when we read it.
# The big problem with the above code is that $/ is a global variable. This if we change $/ in one place of our code, this will change the behavior of perl in# other places of our code and even in third-party modules. So it is better to localize it:

seek(DST, 0, 0);
$/ = undef;
$data = <DST>;
print "\n\URead through slurp way:\n$data\n";

close DATA || die "Couldn't close file !!";
close DST || die "Couldn't close file !!";
