# Using a `case` statement is another way of branching
# control flow.

# A sample usage of `case`.
let i = 1
case i:
of 1:
    echo "i is 1"
of 2:
    echo "i is 2"
else:
    echo "i is not 1 or 2"

# With integers (and other _ordinal types_), `of` branch can specify a range.
let j = 15
case j:
of 1..10:
    echo "j is between 1 and 10"
else:
    echo "j is not between 1 and 10"

let k = "good"
case k:
# Conditions for the same `of` branch are separated with a comma.
of "cool", "good":
    echo "k is cool or good"

# For _ordinal types_ (i.e. booleans, integers, chars), `case` must cover
# all possible cases.
let m = 'a'
case m:
of 'a'..'z':
    echo "variable m holds a letter"
# An `else` branch covers all the remaining cases not specified
# with `of` branches.
# Its body can be declared empty by using the `discard` statement.
else:
    discard