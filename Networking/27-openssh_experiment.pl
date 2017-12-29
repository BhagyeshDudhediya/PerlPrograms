=begin
Problem Statment:
I have set of clients on my local machine.
The characteristics of this client are stored in common/resources/my_resources directory with name perf-c*.
I want to get the list of clients from which I am able to ping my_server.
So steps:
1. ssh to each client
2. id ssh fails, add client to not_reachable list
3. if ssh succeeds, ping my_server and if it fails add client to not_pingable list
3. display not_reachable and not_pingable clients
=cut

#!/usr/bin/perl

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

my (@not_reachable, @not_pingable);

# Get the list of clients from the directory. client has it's resource file as perf-c*
my @clients = `find common/resources/my_resources/ -maxdepth 1 -type f -name "perf-c*" ! -name "*.*" \| cut -d'/' -f4`;

# Set of possible passwords to login to the client from local machine
my @passwds = ("N!am0dAtAd","ABC123!","abc123");
foreach my $client (@clients) {
        chomp($client);
        my $default_os = `grep -R "^default_os\\s*" common/resources/perfweb-lab3/$client\.cfg | awk '{print \$2}'`;
        chomp($default_os);
        my $user = "root";

        if ($default_os ne 'linux') {
                $user = "Administrator";
        }

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

        if ($default_os eq "linux") {
                if ($ssh->system('ping my_server -c 1 > /dev/null')) {
                        print "my_server reachable from $client\n";
                } else {
                        print "my_server not reachable from $client\n";
                        push @not_pingable, $client;
                }
        } else {
                if ($ssh->system('ping my_server > /dev/null')) {
                        print "my_server reachable from $client\n";
                } else {
                        print "my_server not reachable from $client\n";
                        push @not_pingable, $client;
                }
        }
        $ssh->disconnect();
}

print "my_server not pingable from:\n";
print Dumper \@not_pingable;

print "Unreachable Clients:\n";
print Dumper \@not_reachable;
