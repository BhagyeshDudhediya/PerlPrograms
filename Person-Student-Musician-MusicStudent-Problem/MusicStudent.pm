#!/usr/bin/perl

# This package just use Student and Musician but does not inherit it using @ISA.
# This way we can write a module which gets us roperties of 2 classes without inheriting it.
# This method is called COMPOSITION as we are storing objects of 2 classes without inheriting it.
package MusicStudent;

use Data::Dumper qw(Dumper);
use Student;
use Musician;
use strict;
use warnings;

sub new {
	my ($class, $name, $address, $college, $instrument) = @_;
	my $student_obj = Student->new($name, $address, $college);
	my $musician_obj = Musician->new($name, $address, $instrument);
	
	my $self = {
		_stu_obj => $student_obj,
		_music_obj => $musician_obj,
	};
	
	bless $self, $class;
	return $self;
}

sub display {
	my ($self) = @_;
	print "Inside display...\n";
	
	my $student_data = $self->{_stu_obj}->display();
	my $musician_data = $self->{_music_obj}->display();

	# Parse the 2 hashes and avoid the repeating keys	
	foreach my $key (keys %{$musician_data}) {
		if (exists($student_data->{$key})) {
			next;
		} else {
			$student_data->{$key} = $musician_data->{$key};
		}
	}
	
	print Dumper $student_data;
}

1;