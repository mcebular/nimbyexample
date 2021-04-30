# Tables are Nim's key-value collections (also known
# as _maps_ or _dictionaries_ in other languages).

# Also see [Nim's documentation of table module](https://nim-lang.org/docs/tables.html).

# &nbsp;

# To use tables, we import the `tables` module.
import tables

# To create an empty table, call `initTable` proc,
# specifying key and value types.
var fruit_prices = initTable[string, int]()

# Add/set key-value pair to table.
fruit_prices["apple"] = 75
fruit_prices["kiwi"] = 60
fruit_prices["banana"] = 45
echo fruit_prices

# Existance of a key can be checked with `hasKey` proc.
echo "kiwi? ", fruit_prices.hasKey("kiwi")

# A key value pair can be removed by calling `del` proc.
fruit_prices.del("banana")
echo fruit_prices

# Use `len` proc to get number of pairs in the table.
echo "pairs #: ", fruit_prices.len

# A table can also be initialized with values directly.
var numbers = {1: "one", 2: "two", 3: "three"}.toTable
echo numbers

# Table's key-value pairs can be iterated using `for` loop.
for fruit, price in fruit_prices:
    echo fruit, " costs ", price

# Reassinging a table will make a copy of it!
var numbers2 = numbers
numbers.del(1) # not removed from numbers2
echo numbers
echo numbers2

# To work with references instead of values, use
# `TableRef` type instead of `Table`.
# `TableRef` can be created with `newTable` proc.
var letters = newTable[char, string]()
letters['a'] = "first"
letters['b'] = "second"

var letters2 = letters
letters.del('b') # also removed from letters2
echo letters
echo letters2

# Later on, in [references example](references.html), we will
# learn more about working with references.