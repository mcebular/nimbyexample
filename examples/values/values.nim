# Nim has all the standard value types you would expect.

# Strings. Use `&` for string concatination.
echo "Hello!"
echo "nim" & "ble"

# Integers and floats.
echo 15 + 6
echo 33.5 / 2

# Booleans, with operators `and`, `or` and `not`.
echo true and false
echo true or false
echo not true

# Use `$` to convert a value to a string.
echo "15 + 3 = ..."
echo $(15 + 3)

# An example of string concatination and conversion to string.
echo "not true is " & $(not true)