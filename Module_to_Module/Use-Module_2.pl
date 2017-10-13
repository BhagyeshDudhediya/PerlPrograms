#!/usr/bin/perl

use Module_2;

# do_something() and do_something_awesome() are in @EXPORT, hence no :: required
do_something_awesome();
do_something();

# do_nothing() is in @EXPORT_OK, hence Module_2::do_nothing() required to call it
Module_2::do_nothing();

# Following line will fail (as it is in EXPORT_OK). Uncomment and try it.
# do_nothing();

# Now as do_nothing() is exported explicitly using qw(do_nothing), so now do_nothing() can be used as normal export function.
use Module_2 qw(do_nothing);
do_nothing();