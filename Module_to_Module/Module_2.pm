#!/usr/bin/perl

package Module_2;

=begin
@Export allows to export the functions and variables of modules to user’s namespace using the standard import method.
This way, we don’t need to create the objects for the modules to access its members.

@EXPORT_OK does export of symbols on demand basis for selective list of symbols (subroutines and variables) of the module.
=cut

use Exporter qw(import);
@EXPORT = qw(do_something_awesome do_something);
@EXPORT_OK = qw(do_nothing);

sub do_something_awesome {
	print "do_something_awesome() called\n";
}

sub do_something {
	print "do_something() called\n";
}

sub do_nothing {
	print "do_nothing() called\n";
}