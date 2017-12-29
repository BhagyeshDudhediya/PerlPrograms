=begin
Task is to check if set of clients are pingable from local machine
Return  list of clients which are not pingable
=cut

#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my (@clients, @pingable, @unpingable);
for my $i (1..30) {
    push @clients, "client-r730-".$i;
}

foreach my $client (@clients) {
    my $out = `ping -c 1 $client`;
    if ($out =~ "64 bytes") {
        push @pingable, $client;
    } else {
        push @unpingable, $client;
    }
}

print "Pingable Clients:\n";
print Dumper \@pingable;

print "Unpingable Clients:\n";
print Dumper \@unpingable;
