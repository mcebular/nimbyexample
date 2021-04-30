# Objects in Nim are a bit more rigid type than tuples.

# We define a new `object` type by defining a new `type`.
type Person = object
    name: string
    age: int

# An object can be initialized by calling the object constructor.
let alice = Person(name: "Alice", age: 25)
echo alice

echo alice.name, " is ", alice.age, " years old."

# Uninitialized fields will be zero-valued.
let bob = Person(name: "Bob")
echo bob.age, " == 0"

# Order of parameters in constructor does not matter.
let jane = Person(age: 28, name: "Jane")
echo jane

# To create a custom constructor, define a proc returning an
# object instance.
proc newPerson(name: string, age: int): Person =
    Person(name: name, age: age)

let joe = newPerson("Joe", 24)
echo joe

# Reassigning an object will make a copy of it.
var p1 = Person(name: "Bill")
var p2 = p1
p2.name = "Steve" # does not modify p1
echo p1, p2

# In the [references example](references.html), we will learn
# how to work with object references instead of object values.