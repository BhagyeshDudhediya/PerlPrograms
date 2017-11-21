#!/usr/bin/perl

use Data::Dumper;
use JSON;
use strict;
use warnings;

my $cmd_out_success = "
Data-movement to my_cloud:
----------------------------
Data-movement was started on Dec 19 1872 02:44 and completed on Nov xx yyyy 08:15
Files copied: 4, Files verified: 4, Files installed: 4
";

my $cmd_out_partial = "Data-movement to cloud tier:
----------------------------
Data-movement:
    78% complete; time:  4:56:35
Files inspected: 5 of 101, Files moved: 0, Files failed: 0
";
sub ct_command_parser {
	my $cmd_out = shift;
	my $status = shift;
	my $progress_cmd = {};
	if (!defined $status) {
		if ($cmd_out =~ /(\d+)%\s*.*?(Files.*?)\n/ms) {
			$progress_cmd->{'Status %'} = $1;
			my @vals = split(/\s*,\s*/, $2);
			foreach my $val (@vals) {
				my @splits = split(/\:\s+/, $val);
				$progress_cmd->{$splits[0]} = $splits[1]; 					
			}
		}
	} else {
		if ($cmd_out =~ /(Files.*?)\n/ms) {
			if ($status eq 'PASS') {
				$progress_cmd->{'Status %'} = 100;
			} else {
				$progress_cmd->{'Status'} = $status;
			}
			my @vals = split(/\s*,\s*/, $1);
			foreach my $val (@vals) {
				my @splits = split(/\:\s+/, $val);
				$progress_cmd->{$splits[0]} = $splits[1]; 					
			}
		}
	}
	
	return encode_json($progress_cmd);
}



#my $cmd_parsed = ct_command_parser($cmd_out_success, 'PASS');
my $cmd_parsed = ct_command_parser($cmd_out_partial);
print $cmd_parsed."\n";
print Dumper decode_json($cmd_parsed);
