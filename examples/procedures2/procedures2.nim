# A bit deeper insight into Nim's procedures.


# **Overloading**

# Multiple procedures with the same name can be declared,
# providing that their number and/or types of arguments differ.
proc what_is(a: int) = echo "an int"
proc what_is(a, b: int) = echo "two ints"
proc what_is(a: int, b: float) = echo "an int and a float"

what_is(3)
what_is(3, 6)
what_is(4, 8.99)

# **Variadic procedures**

# A procedure with variadic number of arguments can be defined
# using `varargs` statement.
proc int_sum(numbers: varargs[int]): int =

# In the procedure, varargs argument acts as an array.
    echo numbers
    for number in numbers:
        result = result + number

echo int_sum(5, 5, 2, 2, 1)

# **Mutable arguments**

# Proc arguments are immutable. They can be made mutable by
# declaring it with `var` statement.
proc half(number: var float) =
    number = number / 2

# Notice how `half` proc has no return type, and `my_number` variable
# is modified directly.
var my_number: float = 25
half my_number
echo "My number is ", my_number


# **Named arguments**

# A procedure with `first` and `second` arguments.
proc concat(first, second: string) = echo first & second

# When calling a proc, arguments can be addressed by name.
concat(first="cool", second=" and good")

# When addressing arguments by name, their order does not matter.
concat(second=" and well", first="alive")

# Naming and not-naming arguments can mix. Note that in such cases,
# order of the not-named arguments is important.
concat("nice", second=" and easy")


# **Default argument values**

# Proc arguments can be initialized with a default value.
proc divide(number: float = 10, divisor = 2.0): float =
    number / divisor

# Default value is used if argument is not specified.
echo divide(12) # using default divisor
echo divide(divisor = 4) # using default number