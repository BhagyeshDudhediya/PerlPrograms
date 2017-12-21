#/usr/bin/perl

use strict;
use warnings;
use JSON;
use Data::Dumper;

my $status_cmd_out_partial = "Data-movement to my_cloud:
----------------------------
Data-movement was started on *** and completed on ***
Moved (***): *** GiB, (***): *** TiB,
Files inspected: 18 of 18, Files moved: 13, Files failed: 0

Data-movement recall:
---------------------
Path Name (*)                       Status    Bytes Copied   Bytes Copied   Time Queued (**)    Time Started        Time Ended
                                              (Pre-comp)     (Post-comp)
---------------------------------   -------   ------------   ------------   -----------------   -----------------   ----------
/root/root_ke_ander/aur_ander/file1 running   100.00 GiB     27.41 GiB            ****                ****             -
/root/root_ke_ander/aur_ander/file2   running   100.00 GiB     27.41 GiB            ****                ****             -
---------------------------------   -------   ------------   ------------   -----------------   -----------------   ----------
";

my $status_cmd_out_sucess = "Data-movement to my_cloud:
----------------------------
Data-movement is initializing..

Data-movement recall:
---------------------
No recall operations found.
";

sub another_cmd_parser {
	my $recall_cmd_out = shift;
	my $status = shift;
	my $parsed_cmd_out = {};
	if (!defined $status) {
		if ($recall_cmd_out =~ /(\/.+?)\-{2}/ms) {
			my @file_data = split(/\n/, $1);
			foreach my $entry (@file_data) {
				my @vals = split(/\s+/, $entry);
				($parsed_cmd_out->{$vals[0]}->{'path'} = $vals[0]) =~ s/.*\///;
				$parsed_cmd_out->{$vals[0]}->{'status'} = $vals[1];
				$parsed_cmd_out->{$vals[0]}->{'pre-comp GiB'} = $vals[2];
				$parsed_cmd_out->{$vals[0]}->{'post-comp GiB'} = $vals[4];		
			}
		}
	} else {
		$parsed_cmd_out->{'RECALL'}->{'status'} = ($status eq 'PASS') ? "completed":"failed";
	}
	
	return encode_json($parsed_cmd_out);
}

my $parsed_cmd = another_cmd_parser($status_cmd_out_partial);
print $parsed_cmd;
print Dumper decode_json($parsed_cmd);