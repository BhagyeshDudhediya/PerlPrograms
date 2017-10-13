#!/usr/bin/perl

# BEGIN Blocks are executed immediately once it is found, even before entire file is compiled. Executed sequentially.
BEGIN {
	print "The 1st BEGIN\n";
}
BEGIN {
	print "The 2nd BEGIN\n\n";
}

# INIT blocks are executed just before perl runtime begins execution. Executed sequentially.
INIT {
	print "The 1st INIT\n";
}
INIT {
	print "The 2nd INIT\n\n";
}

# CHECK blocks executed just before initial perl compile phase ends and before runtime begins. Executed in LIFO order(Last In First Out)
CHECK {
	print "The 1st CHECK\n\n";
}
CHECK {
	print "The 2nd CHECK\n";
}

# Executed after perl program is compiled.
print "The 1st Code Statement\n";
print "The 2nd Code Statement\n\n";

# END block executed at end of perl program just before interpreter exits. Executed in LIFO order.
END {
	print "The 1st END\n\n";
}
END {
	print "The 2nd END\n";
}