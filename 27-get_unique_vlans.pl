=begin
Task is..I have set of clients with it's resource file (haing key-value pair) at a particular location.
Each client has a vlan associated with it. I have to get the unique vlans in my entire resource list
=cut
#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $resource_path = "/auto/home/resources/bhagyesh";

my $grep_cmd = "find $resource_path -maxdepth 1 -type f ! -name \"*.*\" \| xargs grep -lR \"^type\\s*client\" \|xargs grep -R \"^base_vlan\\s*\" \| awk '{print \$2}' \| sort \| uniq";
my @vlans = `$grep_cmd`;
print Dumper \@vlans;
