=begin
A set of cients have 2 kernels..one is 2.6.32-514* and other is 2.6.32-693*(default kernel) .
The task is to remove a kernel from each of this machine and just keep the default kernel in it
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

my (@not_reachable, @not_present);
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

	if ($ssh->system('cat /boot/grub2/grub.cfg | grep "CentOS Linux (3.10.0-514"')) {
        if ($ssh->system('package-cleanup -y --oldkernels --count=1')) {
            print "CentOS 514 removed on $client\n";
        } else {
            print "CentOS removal failed on $client\n";
        }
    } else {
        print "CentOS 514 not present\n";
		push @not_present, $client;
	}
	$ssh->disconnect();
}

print "CentOS 514 not present on:\n";
print Dumper \@not_present;

print "Unreachable Clients:\n";
print Dumper \@not_reachable;
