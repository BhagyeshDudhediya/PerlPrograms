#!/usr/bin/perl

# No need to add 'use Parent' as Employee already does it
use Employee;

print "\UUSING PARENTCLASS OBJECT\n";
# Create parent class object
$personObj = new Person("George", 24);
# getAllData() returns reference to array, hence we need to de-reference it and print
print "@{$personObj->getAllData()}\n";

# Change firstname of Person
$personObj->setFirstName("John");

# getAllData() returns reference to array, hence we need to de-reference it and print
print "@{$personObj->getAllData()}\n";

print "\n\UUSING SUBCLASS OBJECT\n";
# Create Sub-class object
$employeeObj = new Employee("Jennie", 27, 187896);
$employeeData = $employeeObj->getAllData();
print "Employee Data: @{$employeeData}\n";

print "\n\UGet parent's data using child's object:";
# Call getAge() using employee class (subclass's) object.
# As getAge() is not defined in sub-class, it will call parent's getAge(), in the sequence of classes defined in @ISA array
$firstName = $employeeObj->getFirstName();
$age = $employeeObj->getAge();
print "\nEmployee Age for $firstName = $age\n";

# Here DESTROY for both the classes will be called as after this object goes out of scope