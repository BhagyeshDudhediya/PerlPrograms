#!/usr/bin/perl

package Musician;

use Person;
use strict;
use warnings;

our @ISA = qw(Person);

sub new {
	my ($class, $name, $address, $instrument) = @_[0..3];
	my $self = $class->SUPER::new($name, $address);
	$self->{_instrument} = $instrument;
	
	bless $self, $class;
	return $self;
}

sub display {
	my ($self) = @_;
	my $musician_data = $self->SUPER::display();
	$musician_data->{"instrument"} = $self->{_instrument};
	
	return $musician_data;
}

1;