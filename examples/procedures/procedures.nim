# Procedures in Nim are what we would call _functions_ in
# other languages.

# As you've noticed in the previous examples, procedure
# is often abbreviated to _proc_.

# Procedure can be declared with a `proc` statement.
proc greet() =
    echo "Greetings!"
greet()

# Here's a procedure that takes two arguments, a `string` and an `int`.
proc greet(name: string, times: int) =
    echo "Greeting ", name, " ", times, " times!"
greet("Bob", 2)

# If procedure has parameters, parantheses when calling it are optional.
greet "Bob", 3

# When declaring consecutive procedure arguments of the same type, we can omit
# the argument type for all but last argument of the same type.
proc greet(greeting, name: string, times: int) =
    echo greeting, " ", name, " ", times, " times!"
greet("Hello", "Bob", 4)

# Here's a procedure with a defined return type.
proc sum1(a, b, c: int): int =
    return a + b + c
echo sum1(3, 3, 4)

# Procs that declare return type have `result` variable available in-scope,
# which, **if used**, is implicitly returned if there is no explicit return.
proc sum2(a, b, c: int): int =
    result = a + b
    result = result + c
    # will return result
echo sum2(10, 5, 5)

# If `result` variable is **not used**, the very last statement in the proc is returned.
proc sum3(a, b, c: int): int =
    discard a + b
    echo "nothing"
    b + c
    # will return b + c
echo sum3(1, 10, 10)

# This also means `return` statement at the end of the proc can be omitted.
proc sum4(a, b, c: int): int =

    if a < 0:
# Howver, `return` can still be useful for early returns.
        return -a + b + c

    var my_sum = a + b + c
    my_sum
    # will return my_sum

echo sum4(10, 10, 15)

# Another example without `return` statement.
proc sum5(a, b, c: int): int = a + b + c
echo sum5(10, 10, 5)