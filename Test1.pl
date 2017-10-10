#!/usr/bin/perl
use strict;
use warnings;

print "Number of student records to maintain?";
my $num_records = <STDIN>;
my @student_records;

# Populate the student records
for (0..$num_records-1) {
	print "Name:";
	my $stu_name = <STDIN>;
	print "Roll No.:";
	my $stu_roll_no = <STDIN>;
	print "Marks:";
	my $stu_marks = <STDIN>;
	my %student_hash = (
		"name" => $stu_name,
		"roll_no" => $stu_roll_no,
		"marks" => $stu_marks,
	); 
	push @student_records, \%student_hash;
	
}

# Sort the students aray with marks.
my @sort_marks = sort {$a->{marks} <=> $b->{marks}} @student_records;
open (MY_FILE, ">student_data.txt");
print MY_FILE "Max marks obtained by:\nNAME: ", $sort_marks[$#sort_marks]->{name}, "ROLL NO.: ", $sort_marks[$#sort_marks]->{roll_no};

printf "Enter roll number to view:";
my $roll_number = <STDIN>;
my $i;
for ($i = 0; $i < $#student_records; $i++) {
	if ($student_records[$i]->{roll_no} == $roll_number) {
		print MY_FILE "\nDETAILS FOR ROLL_NO. $roll_number NAME: ", $student_records[$i]->{name}, "MARKS: ", $student_records[$i]->{marks};
		last;
	}
}

if ($i == $#student_records-1) {
	print "No record exists...";
}

# Sort the students array with roll number.
my @sort_roll = sort {$a->{roll_no} <=> $b->{roll_no}} @student_records;
print MY_FILE "\nData in sorted way for roll number:\n";
foreach my $item (@sort_roll) {
	print MY_FILE "Roll No.: ", $item->{roll_no}, "Name: ", $item->{name}, "Marks: ", $item->{marks};
}