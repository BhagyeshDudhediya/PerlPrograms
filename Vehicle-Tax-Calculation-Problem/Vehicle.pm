#!/usr/bin/perl

package Vehicle;
use strict;
use warnings;

sub new {
	my ($class) = shift;
	my $self = {
		_reg_no => shift,
		_owner => shift,
		_price => shift,
	};
	
	bless $self, $class;
	return $self;
}

sub get_vehicle_data {
	return {
		"Registration_no" => $_[0]->{_reg_no},
		"Owner" => $_[0]->{_owner},
		"Price" => $_[0]->{_price}
		
	};
}

1;