#!/usr/bin/perl

my $PID = `cat PID`;
print $PID . "\n";
chomp $PID;

print $PID, "\n";

print "Effective user id=$>\n";
if ($>) {
	print "Root user\n";
} else {
	print "Non root user\n";
}

#chdir '/' or die "Cannot cd to /: $!";

#my $ls = `ls`;
#print $ls;


sub foo {
	print "__FUNCTION__\n";
	return 1;
}

my $rv = foo();
print $rv unless($rv);

sub count {
	my $cnt = shift;
	for (1..10) {
		print $cnt, "\n";
		$cnt--;
	}
}

my $count = 10;
count($count);
print "END=$count\n";

my @array = qw/Bhgayesh Vijay Dudhediya/;
if (not grep $_ eq "Vijaykumar", @array) {
	print "Not in array..\n";
} else {
	print "In array..\n";
}

sub trim($$) {
	my $currArr = shift;
	my $nextArr = shift;
	if (@{$nextArr}) {
		foreach $ele (@$currArr) {
			print $ele, "\n";
		}
	}
	push $nextArr, 'd';
}

my @int = [1,3,4];
my @char = [a,b,c];
my @str;

trim(\@int, \@char) if (@int);
trim(\@char, \@str) if (@char);
trim(\@str, undef);	    if (@str);

print Dumper @char;
