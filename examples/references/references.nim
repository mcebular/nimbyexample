# As you might have noticed in some previous examples,
# reassigning a `Table`, `tuple` or `object` will create a copy of
# it and its containing values.

# When working with _references_ instead of with _values_ is needed,
# The `ref` keyword can be used.

# This declares a variable as a reference to an `int`.
var ref1: ref int

# A declared, but unassigned variable of reference type will hold `nil`.
echo "ref1 is nil? ", isNil ref1

# To create a reference, use the `new` proc.
# The actual value of the reference will be zero-valued.
var ref2 = int.new()
echo "ref2 is nil? ", isNil ref2

# When required, a reference can be de-referenced with `[]` operator.
echo ref2[]
ref2[] = 5
echo ref2[]

# Trying to de-reference a `nil` reference will cause a crash.
# Use `isNil` proc to check if reference points to a valid value.
if not isNil ref1:
    echo ref1[]
else:
    echo "ref1 is nil!"

# An object type can be defined as reference-based by declaring it as `ref object`.
type CatRef = ref object
    name: string

let c1 = CatRef(name: "Mittens")

# When accessing object fields, de-referencing is not required (it is done implicitly).
echo c1[].name, " == ", c1.name

# Since the type is reference-based, reassignment will **not** make a copy of the
# object (contrary to value-based types).
let c2 = c1
c2.name = "Kitty"
echo c1[], c2[]

# Here, we define a new object type `Person`, and a new object type `PersonRef`,
# which is just a reference to the `Person` object.
type Person = object
    name: string
type PersonRef = ref Person

let per_ref = PersonRef(name: "Bob")
echo per_ref[]

# `PersonRef` type can now be de-referenced to `Person` type.
var per1: Person = per_ref[]

# Assigning a de-referenced object will make a copy of it
# (de-referenced object modification does not modify reference's object).
var per2: Person = per_ref[]
per_ref.name = "Alice"
per1.name = "Mary"
per2.name = "Jane"
echo per_ref[], per1, per2