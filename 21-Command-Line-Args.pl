#!/usr/bin/perl

=begin
This covers the command line arguments parsed using GetOptions().
This sample takes source file to copy file to destination as command line argument.

Usage:
perl 21-Command-Line-Args.pl --from|-f <source-file> --to|t <dest-file>

Description on GetOptions():

GetOptions(
	"flag1|short-flag1=<type>" => \<$value>,
	"flag2|short-flag2",
	...
)

flag1,flag2,.. : Flags/Options to be passed to the script. Example: --from my-file.txt
short-flag1, short-flag2,.. : The corresponding short (1 char) flag/option. Example: -f my-file.txt
type: the data type for the flag value (string(s), integer(i), floating point no.(f), etc).
\<$value>: The reference for the value for that option/flag.

Just remember that the variables on the right hand side of the "fat comma(=>)" operators need to have a back-slash
when calling GetOptions.

Other way to do this is with normal command line args, perl provides @ARGV which stores the arguments provided to script
through command lines. @ARGV does not contain script name, it just contains options passed t the script.
$0 contains the name of the script being executed.
=cut

use strict;
use warnings;
use v5.010;
use Getopt::Long qw(GetOptions);

my $src = undef;
my $dst = undef;
GetOptions(
	"from|f=s" => \$src,
	"to|t=s" => \$dst,
) or die "USAGE: $0 --from|-f <src> --to|t <dst>\n";

if (not defined $src or not defined $dst) {
	die "Inalid args provided.\nUSAGE: $0 --from|f <src> --to|t <dst>\n";
}

open(SRC, "<", $src) or die "Could not open $src to read. Error: $?";

# Reading file with slurp way.
$/ = undef;
my $data = <SRC>;

# Writing data to dst file
open(DST, ">", $dst) or die "Could not open $dst to write. Error: $?";
print DST $data;

print "Copy from $src to $dst completed..\n";