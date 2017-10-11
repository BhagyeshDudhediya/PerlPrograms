#!/usr/bin/perl

#############################################
## Create and access Hash of hash
#############################################
%HoH = (
    flintstones => {
        husband   => "fred",
        pal       => "barney",
    },
    jetsons => {
        husband   => "george",
        wife      => "jane",
        boy => "elroy",  # Key quotes needed.
    },
    simpsons => {
        husband   => "homer",
        wife      => "marge",
        kid       => "bart",
    },
);

print "\UMethod 1:\n";
foreach $key (keys %HoH) {
	print "{$key} \n";
	foreach $subkey (keys %{$HoH{$key}}) {
		print "\t$subkey => $HoH{$key}{$subkey}\n";
	}
}

print "\n\UData for simpsons:\n";
foreach $subkey (keys %{$HoH{simpsons}}) {
	print "$subkey => $HoH{simpsons}{$subkey}\n";
}
##############################################
## Manipulating hashes of hashes
##############################################

$HoH{george} = {wife => "janie", son => "sam"};
print "\n\UAfter adding new hash in hash:\n";
foreach $key (keys %HoH) {
	print "{$key} \n";
	foreach $subkey (keys %{$HoH{$key}}) {
		print "\t$subkey => $HoH{$key}{$subkey}\n";
	}
}

print "\n\UAfter deleting george from hash of hash:\n";
delete($HoH{george});
foreach $key (keys %HoH) {
	print "{$key} \n";
	foreach $subkey (keys %{$HoH{$key}}) {
		print "\t$subkey => $HoH{$key}{$subkey}\n";
	}
}