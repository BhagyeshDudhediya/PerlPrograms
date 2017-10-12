# Child Class of Person

package Employee;

# If Person.pm is not in any path in @INC array we do it this way to include Person module here.
# Format to include such modules: use lib "path_to_module"
# use lib "Person";
use Person;

our @ISA = qw(Person);

sub new {
	print "Employee(sub-class)::new called\n";
	my $class = shift;
	#my $self = $class->SUPER::new($_[0], $_[1]);
	my $self = Person->new($_[0], $_[1]);
	
	# New member only in subclass
	$self->{_id} = $_[2];
	bless $self, $class;
	return $self;		
}

sub setId {
	my $self = @_;		# Now $_ has one less element
	my $id = $_[0];
	$self->{_id} = $id;
}

sub getId {
	# $_[0] is self ('this' pointer)
	return $_[0]->{_id};
}

sub getAllData {
	my $self = shift;
	
	# First get data from parent class Parent.
	my $person_data = $self->SUPER::getAllData();
	
	# Add the remaining data to data from Person class.
	push @{$person_data}, $self->{_id};
	return $person_data;
}

sub DESTROY {
	print "Employee(sub-class)::DESTROY called\n";
}

1;