#!/usr/bin/perl

# while: executes until condition is true, if condition is false it comes out of loop
$var = 0;
print "\n\Uwhile loop\n";
while ($var < 10) {
	print "\$var=$var\n";
	$var++;
}

# unless: executes until condition is false, if condition is true it comes out of loop
print "\n\UUntil loop\n";
until ($var <= 5) {
	print "\$var=$var\n";
	$var--;
}

print "\n\Ufor loop\n";
for ($x = 0; $x < 5; $x++) {
	$var += 1;
	print "\$var=$var\n";
}

print "\n\Uforeach loop\n";
@list = (10, 20, 30, 40, 50);
foreach $var (@list) {
	print "\$list[] = $var\n";
}

foreach $var ((1, 2, 3, 4, 5)) {
	print "\$var=$var\n";
}

print "\n\Umultiple lists to foreach loop\n";
@list1 = qw(x y z);
@list2 = qw\a b c\;
foreach $var (@list1, @list2) {
	print "\$var=$var\n";
}

print "\n\Umultiple lists to for loop\n";
for (@list1, @list2) {
	print "\$var=$_\n";
}

print "\n\Udo-while loop\n";
$var = 20;
do {
	printf "\$var=$var\n";
	$var -= 2;
} while($var != 0);

print "\n\UNext statement\n";
$a=10;
while ($a < 20) {
	if ($a == 15) {
		$a = $a + 1;
		next;
	}
	print "\$a=$a\n";
	$a = $a + 1;
}

$a=0;
outer: while($a < 4) {
	$b = 0;
	print "Outer Loop \$a=$a\n";
	inner: while($b < 4) {
		if ($a == 2) {
			print "Jumping to outer loop again\n";
			$a = $a + 1;
			next outer;
		}
		print "InnerLoop \$b=$b\n";
		$b = $b + 1;
	}
	$a = $a + 1;
	if ($a == 5) {
		next inner;
	}
}

print "\n\Ulast statement";
$a=0;
outer: while($a < 4) {
	$b = 0;
	print "Outer Loop \$a=$a\n";
	inner: while($b < 4) {
		if ($a == 2) {
			print "Jumping to outer loop\n";
			$a = $a + 1;
			# last of outer, hence goes out of outer loop
			last outer;
		}
		print "InnerLoop \$b=$b\n";
		$b = $b + 1;
	}
	$a = $a + 1;
}

print "\n\Ucontinue statement\n";
$a=0;
while ($a < 5) {
	print "\$a=$a\n";
} continue {
	$a = $a + 1;
}

print "\n\Uredo statement\n";
$a=0;
while ($a < 5) {
	$a = $a + 1;
	print "\$a=$a\n";
	if ($a == 5) {
		# Here conditioin of while is true, but redo does not evaluate the condition, rather restarts the loop
		redo;
	}
}



print "\n\UDone with loops...";