#!/usr/bin/perl

# Variable shared among processes. But if child changes it, it's reflected only to child and value for parent remains same
$name = "GitHub";

print "Current Process before forking: $$\n";
# Create a child process, parent process gets child's pid, child gets 0.
$child_pid = fork();
die if not defined $child_pid;

# Child process
if ($child_pid eq 0) {
	print "\nIn Child Process. PID=$$\n";
	print "Variable in Child=$name\n";
	$name="GitLab";
	print "Variable in Child after change=$name\n";
	
	# Exit from this child process
	exit;
}

# This is parent process
print "\nIn Parent Process. PID=$$ CHILD=$child_pid\n";
print "Variable in Parent=$name\n";

# Wait for child to exit, else if parent exits before child it will lead to zombie process.
# wait() returns pid of child that has finished it's processing
$child = wait;
print "Child($child) exited, Parent($$) exiting as well..\n";

# Parent creating multiple child process..
print "\n\UExample of parent creating multiple child process...\n";
my $n = 3;
my $forks = 0;
for (1 .. $n) {
  my $pid = fork;
  if (not defined $pid) {
     warn 'Could not fork';
     next;
  }
  if ($pid) {
    $forks++;
    print "In the parent process PID ($$), Child pid: $pid Num of fork child processes: $forks\n";
  } else {
    print "In the child process PID ($$)\n"; 
    sleep 2;
    print "Child ($$) exiting\n";
    exit;
  }
}
 
for (1 .. $forks) {
   my $pid = wait();
   print "Parent saw $pid exiting\n";
}
print "Parent ($$) ending\n";