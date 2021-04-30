
# A standard way to branch control flow is to use an `if` statement.

# A simple `if` statement.
let x = 10
if x == 10:
    echo "x is 10"

# The other side of the `if` branch is `else`.
let y = 11
if y == 10:
    echo "y is 10"
else:
    echo "y is not 10"

# Multiple branches can be specified by using `elif` between first `if` and
# the final `else`.
let name = "Mark"
if name == "Mark":
    echo "Oh, hi Mark."
elif name == "Bob":
    echo "What's up, Bob."
elif name == "Jane":
    echo "Hi, Jane."
else:
    echo "Hello there."

# `if` can also be used as an expression (i.e. performing a **ternary** operation).
let is_ok = if true: "ok" else: "not ok"
echo is_ok

# Conditions can be wrapped in parantheses.
let i = 5
if (i > 5 and i < 10):
    echo "i is between 5 and 10"

# Variables can be defined before the condition.
# Scope of the variable is limited to the branch it was declared in.
if (let j = 7; j < 5):
    echo "j in scope: ", j
elif (let k = 8; k < 5):
    echo "j not in scope, k in scope: ", k
else:
    echo "neither j nor k in scope"