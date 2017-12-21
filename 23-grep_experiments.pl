#!/usr/bin/perl 
use Data::Dumper; 
use JSON;
 
#print `grep -e kiran -e test_name\*BOOST common/requests/*` 
#print `cat ./common/requests/* | awk '/kiran/ && /BOOST/ {print ;}'` 
=begin 
my @status;$
my $idx_path = "./list.idx"; 
 
my @reqs = (); 
if (@status and $status[0] ne 'ALL') { 
$  foreach $stat (@status) { 
$      my @match_reqs = `grep $stat $idx_path | cut -d' ' -f1`; 
$      push(@reqs, @match_reqs); 
$  } 
} else { 
$  @reqs = `grep "" $idx_path | cut -d' ' -f1`;     
}$
 
@reqs = sort (@a cmp $b) @reqs; 
print Dumper \@reqs; 
print scalar @reqs; 
=cut
my $requests_dir = "./common/requests/"; 
#my @test_state = ('PEND', 'RUN', 'FAIL');
my @owner;# = ('john', 'bhagyesh');
my $test_name = "Type4";
#my @resources = ('client-1', 'bhagyesh');
#my @resources = ('t', 't5');
my @comment = ("6.0.1", "BOOST");

my $grep_cmd = "find ./common/requests/ -maxdepth 1 -type f \\( -iname \"*\" ! -iname \"*.*\" \\)";
if (@test_state) {
   my $cmdstr = join("|^state\\s*", @test_state);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^state\\s*$1/;
   $grep_cmd .= "|" . $cmdstr . "\"";
}

if (@owner) {
   my $cmdstr = join("|^email\\s*", @owner);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^email\\s*$1/;
   $grep_cmd .= "|" . $cmdstr . "\"";
}
if ($test_name) {
   #my $cmdstr = join("|^test_name\\s*", @test_name);
   #$cmdstr =~ s/(.*)/xargs grep -lrE \"\^test_name\\s*$1\*/;
   #$grep_cmd .= "|" . $cmdstr . "\"";
   $grep_cmd .= "|xargs grep -lrE \"^test_name\\s\+\.\*$test_name\"";
}

if (@run_type) {
   my $cmdstr = join("|^test_name\\s*", @run_type);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^test_name\\s*$1/;
   $grep_cmd .= "|" . $cmdstr . "\"";
}
if (@comment) {
   my $cmdstr = join("|^comment\\s*", @comment);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^comment\\s*$1\*/;
   $grep_cmd .= "|" . $cmdstr . "\"";
}
if (@status) {
   my $cmdstr = join("|^status\\s*", @status);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^status\\s*$1/;
   $grep_cmd .= "|" . $cmdstr . "\"";
}
if (@error) {
   my $cmdstr = join("|^error_status\\s*", @error);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^error_status\\s*$1/;
   $grep_cmd .= "|" . $cmdstr."\"";
}
if (@resources) {
   my $cmdstr = join("|^target_ddr\\s*", @resources);
   $cmdstr =~ s/(.*)/xargs grep -lrE \"\^target_ddr\\s*$1/;
   my $replica = join("|^replica_ddr\\s*", @resources);
   $replica =~ s/(.*)/|^replica_ddr\\s*$1/;
   my $clients = join("|^client[\\d]\\s*", @resources);
   $clients =~ s/(.*)/|^client[\\d]\\s*$1/;
   my $lock_resources = join("|^resources\\s*", @resources);
   $lock_resources =~ s/(.*)/|^resources\\s*$1/;
   my $wan_emulators = join("|^wan\\s*", @resources);
   $wan_emulators =~ s/(.*)/|^wan\\s*$1/;
   my $ecs_node = join("|^ecs_node\\s*", @resources);
   $ecs_node =~ s/(.*)/|^ecs_node\\s*$1/;
   my $virtustream_node = join("|^virtustream_node\\s*", @resources);
   $virtustream_node =~ s/(.*)/|^virtustream_node\\s*$1/;
   my $aws_node = join("|^aws_node\\s*", @resources);
   $aws_node =~ s/(.*)/|^aws_node\\s*$1/;
   my $azure_node = join("|^azure_node\\s*", @resources);
   $azure_node =~ s/(.*)/|^azure_node\\s*$1/;
   $cmdstr = $cmdstr.$replica.$clients.$lock_resources.$wan_emulators.$ecs_node.$virtustream_node.$aws_node.$azure_node."\n";
   $grep_cmd .= "|" . $cmdstr."\"";
}

$grep_cmd .= "|sort|tail -n2";
print $grep_cmd."\n\n";
my @reqs = `$grep_cmd`;#."|sort|tail -n2"`;
print $grep_cmd."\n\n";
foreach $req (@reqs) {
    print $req."\n";
}

#$req_file = (split '/', $req_file)[-1];
my $cmd_out = "Data-movement to cloud tier:
----------------------------
Data-movement:
    3% complete; time:  4:56:35
    Moved (post-comp): None, (pre-comp): 2.65 TiB,
    Files inspected: 5 of 101, Files moved: 0, Files failed: 0

    Data-movement recall:
    ---------------------
    No recall operations found.";

sub ct_command_parser {
    my $cmd_out = shift;
    my $status = shift;
    my $progress_cmd = {};
    if (!defined $status) {
        if ($cmd_out =~ /(\d+)%\s*.*?(Files.*?)\n/ms) {
            $progress_cmd{'Status %'} = $1;
            my @vals = split(/\s*,\s*/, $2);
            foreach $val (@vals) {
                my @splits = split(/\:\s+/, $val);
                $progress_cmd{$splits[0]} = $splits[1];                     
            }
        }
    } else {
        if ($cmd_out =~ /(Files.*?)\n/ms) {
            if ($status eq 'PASS') {
                $progress_cmd{'Status %'} = 100;
            } else {
                $progress_cmd{'Status'} = $status;
            }
            my @vals = split(/\s*,\s*/, $1);
            foreach $val (@vals) {
                my @splits = split(/\:\s+/, $val);
                $progress_cmd{$splits[0]} = $splits[1];                     
            }
        }
    }   
    return encode_json(\%progress_cmd);
}

print ct_command_parser($cmd_out);
