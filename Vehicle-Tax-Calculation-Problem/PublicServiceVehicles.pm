#!/usr/bin/perl

package PublicServiceVehicles;

use Vehicle;
use Data::Dumper;
use strict;
use warnings;

our @ISA = qw(Vehicle);

sub new {
	my ($class, $reg_no, $owner, $price, $govt_dept, $is_emergency) = @_;
	my $self = $class->SUPER::new($reg_no, $owner, $price);
	$self->{_govt_dept} = $govt_dept,
	$self->{_is_emergency} = $is_emergency;
	
	bless $self, $class;
	return $self;
}

sub get_vehicle_data {
	my ($self) = shift;
	my $veh_data = $self->SUPER::get_vehicle_data();
	
	$veh_data->{"Govt. Dept"} = $self->{_govt_dept};
	$veh_data->{"Is Emergency"} = $self->{_is_emergency};
	
	return $veh_data;
}

sub compute_tax {
	my ($self) = @_;
	
	my $tax = 0;
	
	# If vehicle is not emergency vehicle, then tax applied
	if ($self->{_is_emergency} eq 'no') {
		$tax = ($self->{_price} * 10 / 100);
	}
	
	return $tax;
}

1;