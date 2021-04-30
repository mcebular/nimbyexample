# Variables in Nim can be declared with `var` and `let`
# statements.

# `var` statement declares a mutable variable.
var counter = 1
inc counter
echo counter

# `let` statement declares an immutable variable.
let name = "Jeremy"
echo name

let x = 15
echo x

# Modifying an immutable variable will not work.
#! name = "Jerry"
#! inc x

# Variable type can be explicity declared.
var long_number: int64 = 335_811
echo long_number

# Multiple variables can be declared with a single
# `var`/`let` statement using indentation.
var
    a = 1
    b = 2.5
    c = "clouds"
echo a, ", ", b, ", ", c

# Variables declared without an initial value are zero-valued.
# Without initialization, the type of the variable must be declared.
var num1: int
echo num1

# Variables declared with `let` statement require initialization.
let num2 = 15
echo num2