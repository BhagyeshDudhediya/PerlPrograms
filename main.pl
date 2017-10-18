#!/usr/bin/perl

use MusicStudent;

print "Please enter the details:\nName:";
my $name = <STDIN>;
chomp $name;
print "Address:";
my $address = <STDIN>;
chomp $address;
print "College:";
my $college = <STDIN>;
chomp $college;
print "Instrument:";
my $instrument = <STDIN>;
chomp $instrument;

my $music_student = new MusicStudent($name, $address, $college, $instrument);
$music_student->display();