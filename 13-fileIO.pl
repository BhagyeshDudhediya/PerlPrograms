#!/usr/bin/perl

open(DATA, "<1-hello-world.pl") or die "Couldn't open file !!";

# Read single line from file, scalar($) context
$line = <DATA>;
print "Scalar context for read:\n$line\n";
@lines = <DATA>;
print "Array context for read:\n@lines\n";

seek(DATA, 0, 0);
# Copy from one file to other for read+write
open(DST, "+<copied-file") or die "Couldn't open file to write..";
while(<DATA>) {
	print DST $_;
}

seek(DST, 0, 0);
# Read first 10 chars from file
read(DST, $line1, 10, 0);
print "\n\nREAD CHARS FROM FILE:\n$line1\n";

close DATA || die "Couldn't close file !!";
close DST || die "Couldn't close file !!";