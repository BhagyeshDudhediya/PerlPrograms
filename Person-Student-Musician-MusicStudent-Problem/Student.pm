#!/usr/bin/perl

package Student;

use Person;
use strict;
use warnings;

our @ISA = qw(Person);

sub new {
	my ($class, $name, $address, $college) = @_[0..3];
	my $self = Person->new($name, $address);
	$self->{_college} = $college;
	
	bless $self, $class;
	return $self;
}

sub display {
	my ($self) = @_;
	my $student_data = $self->SUPER::display();
	$student_data->{"college"} = $self->{_college};

	return $student_data;	
}

1;