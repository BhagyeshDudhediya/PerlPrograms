#!/usr/bin/perl

package GoodsVehicle;

use Vehicle;
use strict;
use warnings;

our @ISA = qw(Vehicle);

sub new {
	my ($class, $reg_no, $owner, $price, $license_no, $weight, $windows) = @_;
	my $self = $class->SUPER::new($reg_no, $owner, $price);
	
	$self->{_license_no} = $license_no;
	$self->{_weight} = $weight;
	$self->{_windows} = $windows;
	
	bless $self, $class;
	return $self; 
}

sub get_vehicle_data {
	my ($self) = @_;
	my $veh_data = $self->SUPER::get_vehicle_data();
	
	$veh_data->{"License Number"} = $self->{_license_no};
	$veh_data->{"Weight"} = $self->{_weight};
	$veh_data->{"No. of windows"} = $self->{_windows};
	
	return $veh_data;
}

sub compute_tax {
	my ($self) = @_;
	
	# Tax is proprtional to weight and 5% of total price
	my $tax = $self->{_price} * ($self->{_weight}/10) * 5 / 100;
	
	# If light weight vehicle with more than 2 windows, suplementary tax of INR 2000
	if ($self->{_weight} < 1000 and $self->{_windows} > 2) {
		$tax += 2000;
	}
	
	return $tax;
}

1;