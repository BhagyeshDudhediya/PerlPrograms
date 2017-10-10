#/usr/bin/perl

=begin
Array variables are prefixed with the @ sign and are populated using either
parentheses or the qw operator
=cut

@array = (1, 2, 'John');

# Variable Context + same variable name but diff data type(one is array one is scalar)
$array = @array;

print "Array=@array\n";
print "Array Size=$array\n";

@new_array = qw/My Name is 123/;
print "Array=@new_array\n";

print "\$array[0]=$array[0]\n";
# Negative index to print element from last
print "\$array[last]=$array[-$#array-1]\n";

# Other ways to create larger array
@my_nums=(1..10);
@my_chars=('a'..'z');
@my_caps=(A..Z);

print "my_nums=@my_nums\n";
print "my_chars=@my_chars\n";
print "my_caps=@my_caps\n";

# Array Operations
print "\n\UArray Operations:\n";
@array=(1,2,3,4,5);
print "New Array=\t @array\n";

# Add element at end (push)
push(@array, "John");
print "After Push:\t @array\n";
push(@array, "Julie", 10);
print "Push Again:\t @array\n";

# Remove from end (pop)
pop(@array);
print "After Pop:\t @array\n";
# Remove from beginning (shift)
shift(@array);
print ("After shift:\t @array\n");
# Add element at beginning of array
unshift(@array, 1);
print "After unshift:\t @array\n";

# Replace 3 elements from after index 2 with null
splice(@array, 2, 3);
print "After splice:\t @array\n";
# Replace 2 elements after index 1 with something
splice(@array, 1, 2, 'Bhagyesh', 'Dudhediya');
print "After list splice:\t @array\n";

# Replaces 2nd element with Dudhediya and third with null as nothing specified
splice(@array, 1, 2, 'Dudhediya');
print "After list splice2:\t @array\n";

# String->Array and Array->String
$my_str="This-is-example-only";
@str_arr=split('-', $my_str);
print "\nString=$my_str\tArray=@str_arr\n";
$new_str=join('--', @str_arr);
print "Array=@str_arr\tString=$new_str\n";

# Merging array
@merged_num=(1,2,(3,4,5));
print "Array=@merged_num\n";
print "Array[2]=$merged_num[2]\n";

@odd=(1,3,5,7);
@even=(2,4,6,8);
@combined=(@odd, @even);
print "Combined Array: @combined\n";