# _Tuples_ in Nim are sets of (optionally named) fields.

# Wrap values in parantheses to construct a tuple.
let mix = ("first", 15, true, 'a')
echo mix

# For tuples with anonymous (unnamed) fields, the fields can be accessed by index.
echo mix[0]
echo mix[2]

# Tuples are usually more useful when their fields are named.
let car = (color: "red", age: 17)
echo car

# Tuple fields can then be accessed by name instead of by index.
echo car[0], " == ", car.color
echo car.age

# If tuple only defines (anonymous) fields, any tuple with the same field
# types will match.
var pair: (string, string)
pair = ("Bob", "Jim")

# Using tuple with named fields in place of an anonymous tuple will
# lose the field names.
pair = (first: "Alice", second: "Jane")
echo pair
#! will not work:
#! pair.first

# Tuple type definition can also explicitly define field names.
# Syntax in this case uses the `tuple` keyword.
var named_pair: tuple[first: string, second: string]
named_pair = (first: "Bob", second: "Jim")

# An anonymous tuple can be used in place of a tuple with named fields, as long as field types match.
named_pair = ("Bob", "Jim")
echo named_pair.first, " == Bob"

# However for tuples with named fields, field **names** should match.
#! will not work:
#! named_pair = (primary: "Alice", secondary: "Jane")

# Procedures can return multiple values by declaring a tuple as a return type.
proc two_numbers(): (int, int) =
    return (7, 3)

# When calling a procedure that returns a tuple, its result can be _unpacked_.
# Fields we don't need can be ignored with underscore (`_`).
let (_, two) = two_numbers()
echo two

# We can define a tuple as a new type.
type Car = tuple
    color: string
    age: int

# Type `Car` now essentialy works as an alias for type `tuple[color: string, age: int]`.
var c1: tuple[color: string, age: int] = ("blue", 9)
var c2: Car = c1
echo c1, c2

# When tuple is reassigned, a copy of a tuple (and its fields) is made.
inc c2.age
echo c1, c2