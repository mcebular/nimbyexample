# Loops in Nim are done either with a `while` statement or
# with an iterator and `for` statement.

# A classic `while` loop, running until condition is false.
var counter = 10
while counter > 0:
    dec counter

# A `for` loop that iterates from 1 to 3 (inclusive).
echo "Counting to three"
for i in 1..3:
    echo i

# Two dots (`..`) are actually a shortcut for `countup` iterator.
echo "Counting to three"
for i in countup(1, 3):
    echo i

# Upper bound can also be excluded with `..<`.
echo "Counting to two"
for i in 1..<3:
    echo i

# `char`s of a `string` can be iterated.
for c in "abcd":
    echo c

echo "Odd numbers only"
for i in 1..10:

# An iteration can be skipped with a `continue`.
    if i mod 2 == 0:
        continue

# Loops can be broken out of by using a `break`.
    if i >= 6:
        break

    echo i

# Loops cannot have an empty body. `discard` statement can be
# used for such cases.
for i in 1..10:
    discard # an empty loop