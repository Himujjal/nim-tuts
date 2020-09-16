echo "What's your name?"
var name: string = "Himu" 
echo "Hi, ", name, "!"


# ------------------- String --------------------
#[
  # Hello world
  ## Hello
  > This is a quote
]#

# ----------- variable ----------------

var
  x, y: int
  a, b, c: string



const x1 = "abc"
let x2 = "abx"
let input2 = "Hello"

# ------------ control flow ----------------
let name1 = "Hello"
if name1 == "":
  echo "Poor soul, you lost your name?"
elif name1 == "name":
  echo "Very funny"
else:
  echo "Hi, ", name1, "!"


# this statement will be explained later:
from strutils import parseInt

echo "A number please:"
let n1 = parseInt("2")

case n1
of 0..2, 4..7: echo "The number is in the set: {0, 1, 2, 3, 4, 5}l"
of 3, 8: echo "The number is 3 or 8"
else: discard

#  WHILE
echo "What's your nmae?"
var name3 = "Himu"
while name3 == "":
  echo "Please tell me your name: "

for i in countup(1, 10):
  echo i

for i in (1..10):
  echo i


echo "Counting to 10:"
var i = 1
while i <= 10:
  echo i
  i += 1

for i in 0..<10:
  echo i

for index, item in ["a", "b"].pairs:
  echo item, " at index ", index

# -------------- Scopes and block statement --------------
while false:
  var x = "hi"

echo x


block myblock:
  var x = "hi"
echo x # does not work either


# ------------- Break statement ------------------
block myblock:
  echo "entering block"
  while true:
    echo "looping"
    break # leaves the loop, but not the block
  echo "still in block"

block myblock2:
  echo "entering block2"
  while true:
    echo "looping2"
    break myblock2 # leaves the block (and the loop)
  echo "still in block2"


# -------------- when statement -------------
when system.hostOS == "windows":
  echo "running on Windows"
elif system.hostOS == "linux":
  echo "running on Linux!"
elif system.hostOS == "macosx":
  echo ""

const fact4 = (var x3 = 1; for i in 1..4: x3 *= i; x3)


# --------- procedures / functions ------------
proc yes(question: string) : bool =
  echo question, " (y/n)"
  while true:
    case "y"
    of "y", "Y", "yes", "Yes": return true
    of "n", "N", "no", "No": return false
    else: echo "Please be clear: yes or no"

if yes("Should I delete all your important files?"):
  echo "I'm sorry Dave, I'm afraid I can't do that."
else:
  echo "I think you know what the problem is just as well as I do." 


# ---------- result variable -------------
proc sumTillNegative(x: varargs[int]): int =
  for i in x:
    if i < 0:
      return
    result += i

echo sumTillNegative()


# arguments are immutable by default.
# to make them mutable use 'var'
proc printSeq(s: seq, nprinted: int = -1) =
  var nprinted = if nprinted == -1: s.len else: min(nprinted, s.len)
  for i in 0..<nprinted:
    echo s[i]

printSeq @[1, 2] 


# div is operator for division for int
# / is specially for float and returns a float
proc divmod(a, b:int; res, remainder: var int) =
  res = a div b
  remainder = a mod b

var
  x4, y4: int

divmod(8, 5, x, y)
echo x
echo y


# ---------------- discard statements ----------
discard yes("may i ask a pointless question?")

proc p(x, y: int): int {.discardable.} =
  return x + y

p(3, 4)


# -------------- named arguments --------------

proc createWindow(x, y, width, height: int; title: string;
                  show: bool) =
                  echo "hello"

createWindow(show = true,
  title = "my app",
  x = 0,
  y = 0,
  height = 600,
  width = 800)


# overloaded procedures
proc toString(x: int): string =
  result =
    if x < 0: "negative"
    elif x > 0: "positive"
    else: "zero"

proc toString(x: bool): string =
  result =
    if x: "yep"
    else: "nope"

assert toString(13) == "positive" # calls the toString(x: int) proc
assert toString(true) == "yep"    # calls the toString(x: bool) proc

# ---------- operators ----------------

proc even(n: int): bool

# forward declaration:
proc odd(n: int): bool =
  assert(n >= 0) # makes sure we don't run into negative recursion
  if n == 0: false
  else:
    n == 1 or even(n-1)

proc even(n: int): bool =
  assert(n >= 0) # makes sure we don't run into negative recursion
  if n == 1: false
  else:
    n == 0 or odd(n-1)


echo even(3)

# -------- iterators -------------
echo "Counting to ten:"
for i in countup(1, 10):
  echo i

iterator countup2(a, b: int): int =
  var res = a
  while res <= b:
    yield res
    inc(res)

for i in countup2(1, 2):
  echo i

# basic types

# bool
var
  x6: int32 = 1.int32
  y6: int8 = int8('a')
  z6: float = 2.5
  sum: int = int(x) + int(y) + int(z6)

# ----------- advanced types ---------------
type
  biggestInt = int64
  biggestFloat = float64

# ---------- enumerations -----------------
type
  Direction = enum
    north, east, south, west

var x5 = south;
echo x5;


# ---------- sub ranges ---------------
type mySubRange = range[0..5]

# -------- Sets ----------
var s: set[int16];

type CharSet = set[char];

var
  x8: CharSet;

x8 = { 'a'..'z', '0'..'9' };


# ----------- arrays -------------
type
  IntArray = array[0..5, int]

var
  x7: IntArray

x7 = [1, 2, 3, 4, 5, 6]
for i in low(x7)..high(x7):
  echo x7[i]

