# Array is a list of values of a fixed length.

# We declare an array by specifying its index range and type.
var arr1: array[0..4, int]
echo arr1

# If index range is to start at 0, we can use a shortcut by just expressing its length.
var arr2: array[5, int]
echo arr2

# Since we specify the array's index range, index starting with 0 is not a requirement.
var arr3: array[10..15, string]
arr3[10] = "first element"
echo arr3

# Array's index range can actually be of any _ordinal type_.
var arr4: array['a'..'f', float]
arr4['c'] = 7.5
echo arr4

# Array can also be initialized with values directly. In such cases, declaring
# an array type is not required.
var arr5 = ['h', 'e', 'l', 'l', 'o']
echo arr5

# Use `len` proc to get array's length.
echo "arr5 length: ", arr5.len

# Since it's possible for array's range to not start with 0, its low and high bounds
# can be accessed with `low` and `high` procs.
echo "first and last index of arr3: "
echo arr3.low
echo arr3.high

# Multiple dimension arrays can be declared by specifying another array as outer array's value type.
var arr2d: array[3, array[3, int]]
arr2d[1][1] = 99
echo arr2d

# Values of the array can be iterated with a `for` loop.
for val in arr5:
    stdout.write(val)
stdout.write('\n')

# `for` loop with value and its index.
# Note that index starts at array index range's lower bound.
for index, value in arr3:
    echo index, "=", value