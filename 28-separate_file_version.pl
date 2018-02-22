#!/usr/bin/perl

# Problem Description:
# There are files in directory with names in format VER_{file-name}_{version}
# Te task is to separate the file-name and version from each other
# Example: file is VER_my-test-file.pl_1.2.0
# Output: my-test-file.pl  1.2.0


use strict;
use warnings;

my $dir = $ARGV[0];
my @files = `find $dir -type f -name "VER_*_[0-9]*[0-9]"`;

my $all_files;
foreach my $file (@files) {
    $file =~ /VER_(.*)_(.*)/;
    $all_files .= $1."  ".$2."\n";
}

print $all_files if ($all_files);

