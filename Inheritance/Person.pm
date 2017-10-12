=begin
This file covers the object oriented concept in Perl.
In perl, class is nothing but the Perl Package. To create class in Perl we first create a perl package
=cut

# Declare a class names Person. Scope: entire file or until another package keyword is encountered
package Person;

# Constructor
sub new {
	print "Person(Parent-class)::new called\n";
	my $class = shift;
	my $self = {
		_firstName => shift,
		_age => shift,
	};
	print "Initialized value: Name: $self->{_firstName} Age: $self->{_age}\n";
	
	# bless() is used to bind the reference to the class. It returns reference to the class which becomes object for that class
	bless $self, $class;
	return $self;
}

sub setFirstName {
	($self, $name) = @_;
	$self->{_firstName} = $name if defined($name);
}

sub getFirstName {
	$self = $_[0];
	return $self->{_firstName};
}

sub getAge {
	$self = $_[0];
	return $self->{_age};
}

sub getAllData {
	# $self('this' pointer for the class) is $_[0]
	return [$_[0]->{_firstName}, $_[0]->{_age}];
}

# Destructor
sub DESTROY {
	print "Person(Parent-class)::DESTROY called\n";
}

1;