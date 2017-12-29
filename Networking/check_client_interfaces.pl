=begin
The task is to check all the interfaces on set of clients if they have Linke detected: yes
If so, bring them up, change the sysconfig file of it to have ONBOOT=yes and ping it to re-verify
=cut
use Data::Dumper;
use Net::OpenSSH;

my (%client_map, %error, @unreachable_clients);
sub _login {
	my ($host, $user, $pass) = @_;
	my $unFlag=0;
        my $ssh =  Net::OpenSSH->new($host,  
                                      user => $user, 
                                      password => $pass,
                                      master_stderr_discard => 1,
                                      timeout => 300, 
                                      master_opts => [-o => "StrictHostKeyChecking=no", -o => "UserKnownHostsFile=/dev/null", -o => "LogLevel=ERROR"], 
                                      ctl_dir => "/tmp/.libnet-openssh-perl");

	if ($ssh->error) {
		$error{$host} = "$ssh->error";
		return 1;
	} else {
		my ($interfaces, $err) = $ssh->capture2('ifconfig -s | cut -f1 -d " "| grep -v Iface | grep -v lo | grep -v virbr0');
		if ($err) {
			$error{$host} = "ifconfig command failed : $err";
		} else {
			my @all_interfaces = split /\n/, $interfaces;
            my @unpingable_ifcs;
			foreach my $inter (@all_interfaces) {
				chomp $inter;
				my ($out, $rv) = $ssh->capture2("ethtool $inter | grep 'Link detected:' | cut -d':' -f2");
                chomp($out);
				if ($out =~ /yes/) {
					my ($o, $r) = $ssh->capture2("ifup $inter");
					($o, $r) = $ssh->capture2("cat /etc/sysconfig/network-scripts/ifcfg-$inter");
                    ($o, $r) = $ssh->capture2("sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-$inter");
                    ($o, $r) = $ssh->capture2("ping -c 1 $host-$inter");
                    if ($o =~ /64 bytes/) {
                        push @unpingable_ifcs, "$inter All ok";
                    }
                    else {
                        push @unpingable_ifcs, "$inter Not ok";
                    }
				}
				sleep(1);
			}
            $client_map{$host} = [@unpingable_ifcs];
		}
		$ssh->disconnect(1);
	}

    print "\n\n";
	return 0;
}

my @clients;
foreach my $i (1..30) {
    push @clients, "client-r730-".$i;
}

foreach my $client (@clients) {
	chomp $client;
	if (_login($client, 'root', 'N!djajhe@')) {
        push @unreachable_clients, $client;
    }
}
print "List of Unreachable Clients\n";
print Dumper (\@unreachable_clients);
print "Detailed Data\n";
print Dumper (\%client_map);

