#!/usr/bin/perl

package PrivateCars;

use Vehicle;
use strict;
use warnings;

our @ISA = qw(Vehicle);

sub new {
	my ($class, $reg_no, $owner, $price, $engine, $year_of_purchase) = @_;
	my $self = $class->SUPER::new($reg_no, $owner, $price);
	$self->{_engine} = $engine;
	$self->{_year_of_purchase} = $year_of_purchase;
	
	bless $self, $class;
	return $self;
}

sub get_vehicle_data {
	my ($self) = @_;
	
	my $veh_data = $self->SUPER::get_vehicle_data();
	
	$veh_data->{"Engine CC"} = $self->{_engine};
	$veh_data->{"Year of Purchase"} = $self->{_year_of_purchase};
	
	return $veh_data;
}

sub compute_tax {
	my ($self) = @_;
	
	# Tax = 20% of total price
	my $tax = $self->{_price} * 20/100;
	
	if (($self->{_year_of_purchase} - (1900 + (localtime)[5])) < 3 and $self->{_engine} < 1100) {
		# Rebate if 3 years old and engine < 1100cc
		$tax -= 1000;
	}
	
	return $tax;
}

1;