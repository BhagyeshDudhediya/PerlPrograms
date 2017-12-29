=begin
The task is to check if an interface named 'em1' is up on set of clients
=cut
#!/usr/bin/perl
#
use strict;
use warnings;
use Data::Dumper;
use Net::OpenSSH;

sub connect_ssh {
	my ($client, $user, $passwd) = @_;
       	my $ssh =  Net::OpenSSH->new($client,
                                      user => $user,
                                      password => $passwd,
				      master_stderr_discard => 1,
                                      timeout => 300,
                                      master_opts => [-o => "StrictHostKeyChecking=no", -o => "UserKnownHostsFile=/dev/null", -o => "LogLevel=ERROR"],
                                      ctl_dir => "/tmp/.libnet-openssh-perl");

	if ($ssh->error) {
		return undef;
	}
	return $ssh;
}

my (@not_reachable, @not_up);
my @clients;
for my $i (1..30) {
    push @clients, "client-r730-".$i;
}
my @passwds = ("N!djajhe@");
foreach my $client (reverse @clients) {
	chomp($client);
    print $client."\n";
	my $user = "root";

	my $ssh = undef;
	foreach my $passwd (@passwds) {
		$ssh = connect_ssh($client, $user, $passwd);
		if (defined $ssh) {
			last;
		}
	}

	if (!defined $ssh) {
		print "$client not reachable through ssh\n";
		push @not_reachable, $client;
		next;	
	}

    my ($out, $rv) = $ssh->capture2("ethtool em1 | grep 'Link detected:' | cut -d':' -f2");
	if ($out =~ /yes/) {
        print "em1 up on $client\n";
    } else {
        print "em1 down on $client\n";
		push @not_up, $client;
	}
	$ssh->disconnect();
}

print "em1 down on:\n";
print Dumper \@not_up;

print "Unreachable Clients:\n";
print Dumper \@not_reachable;
