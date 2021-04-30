# Sequences in Nim are a list of values, but unlike arrays,
# sequence's length can change at runtime.

# Declaring an empty sequence only requires defining the value type.
var seq1: seq[int]
echo seq1

# To create a non-empty sequence, use the `newSeq` proc.
var seq2 = newSeq[bool](5)
seq2[2] = true
echo seq2

# An array can be converted to a sequence by using the `@` operator.
# This allows initializing the sequence with values the same way as with arrays.
var seq3 = @['o', 'p', 'r']
echo seq3

# `add`, `insert` and `delete` procs can be used to modify the sequence.
seq3.add('s')
seq3.insert('q', 2)
seq3.delete(0)
echo seq3

# Sequences can be concatinated with `concat` proc from _sequtils_ module.
import sequtils
echo concat(@[1, 2], @[3, 4], @[5, 6])

# Sequence can be sliced out of an array by addressing an array with a _slice_.
var arr1 = ['a', 'b', 'c', 'd', 'e']
var arr1slice = arr1[0..2]
echo arr1slice # is of seq[char] type

# _Backwards index operator_ can be used in a _slice_ to address the array from
# the high bound. `^1` is equivalent to `arr1.len-1`.
echo arr1[2..^1], " <=> " , arr1[2..arr1.len-1]

# `len`, `low` and `high` procs work with sequences just like with arrays.
echo "len:  ", seq3.len
echo "low:  ", seq3.low
echo "high: ", seq3.high

# Note however, that sequence's index range always starts with 0.
var arr2: array[10..15, int]
var arr2seq: seq[int] = @arr2
echo "arr2seq range bounds are ",
    arr2seq.low, " and ", arr2seq.high

# Multiple dimension sequences can be declared as well.
var seq2d: seq[seq[int]]
echo seq2d

# Sequences' values can be iterated with `for` just like with arrays.
for index, value in arr2seq:
    echo index, "=", value