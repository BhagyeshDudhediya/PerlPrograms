#!/usr/bin/perl

package Person;

use strict;
use warnings;

sub new {
	my ($class, $name, $address) = @_[0..2];
	my $self = {
		_name => $name,
		_address => $address,
	};
	
	bless $self, $class;
	return $self;
}

sub display {
	return {
		"name" => $_[0]->{_name},
		"address" => $_[0]->{_address},
	};
}

1;