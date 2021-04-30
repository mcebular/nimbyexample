# Constant expressions are evaluated at compile time.

# Constant can be declared with a `const` statement.
const magic_number = 13
echo magic_number

# Similar to `var` and `let`, a list of constants can be
# declared by using indentation.
const
    cool_number = 9
    floating: float64 = 5.99
    quote = "compile-time constant!"

echo cool_number
echo floating
echo quote