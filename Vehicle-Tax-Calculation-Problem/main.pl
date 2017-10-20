#!/usr/bin/perl

use PublicServiceVehicles;
use GoodsVehicle;
use PrivateCars;

use strict;
use warnings;
use Data::Dumper qw(Dumper);
use Switch;

print "Select the type of vehicle:\n1. Public Service Vehicles.\n2. Goods vehicle.\n3. Private Car.\n";
my $vehicle = <STDIN>;
chomp $vehicle;
if ($vehicle <= 0 or $vehicle > 3) {
	print "Invalid Vehicle Type passed";
	exit;
}

print "Registration Number:";
my $reg_no = <STDIN>;
chomp $reg_no;

print "Owner:";
my $owner = <STDIN>;
chomp $owner;

print "Price:";
my $price = <STDIN>;
chomp $price;

my $vehicle_obj;

switch ($vehicle) {
	case 1 {
				print "Is Vehicle Emergency Vehicle?(yes/no)";
				my $is_emergency = <STDIN>;
				chomp $is_emergency;
				print "Govt. Dept:";
				my $govt_dept = <STDIN>; chomp $govt_dept;
					
				$vehicle_obj = new PublicServiceVehicles($reg_no, $owner, $price, $govt_dept, $is_emergency);	
			}
	case 2 {
				print "Your license number:";
				my $license = <STDIN>; chomp $license;
				print "Weight of vehicle:";
				my $weight = <STDIN>; chomp $weight;
				print "Number of windows:";
				my $no_windows = <STDIN>; chomp $no_windows;
										
				$vehicle_obj = new GoodsVehicle($reg_no, $owner, $price, $license, $weight, $no_windows);
	}
	case 3 {
				print "CC of Engine:";
				my $engine_cc = <STDIN>; chomp $engine_cc;
				print "Year of purchase:";
				my $year_of_purchase = <STDIN>; chomp $year_of_purchase;

				$vehicle_obj = new PrivateCars($reg_no, $owner, $price, $engine_cc, $year_of_purchase);
	}
	else {
			print "Invalid Vehicle Type";
			die;
	}
}

my $vehicle_data = $vehicle_obj->get_vehicle_data();
print "\UVehicle Data:\n";
print Dumper $vehicle_data;

my $tax = $vehicle_obj->compute_tax();
print "\UTax=$tax\n";