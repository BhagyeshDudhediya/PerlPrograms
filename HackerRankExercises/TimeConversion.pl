#!/usr/bin/perl

=begin
Given a time in -hour AM/PM format, convert it to military (24-hour) time.

Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 
24-hour clock.

INPUT FORMAT
A single string containing a time in 12-hour clock format (i.e. hh:mm:ssAM or hh:mm:ssPM), where 00 <= hh <= 12 and 00<=mm, and ss<=59

OUTPUT FORMAT
Convert and print the given time in 24-hour format, where 00 <= hh <= 23.

Sample Input
07:05:45PM

Sample Output
19:05:45
=cut

sub timeConversion {
    my ($time) = @_;
    my @hr_min_sec = split /\D/, $time;
        
    if ($time =~ m/AM/) {
        if ($hr_min_sec[0] == 12) {
            $hr_min_sec[0] = "00";
        }
    } else {
    	if ($hr_min_sec[0] != 12) {
    		$hr_min_sec[0] += 12;	
    	}
    }
    
    return join ":", @hr_min_sec;
}

$s = <STDIN>;
chomp $s;
$result = timeConversion($s);
print "$result\n";

