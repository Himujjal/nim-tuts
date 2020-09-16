# ---------- types -------------
type
  Direction2 = enum
    north, east, south, west
  BlinkLights = enum
    off, on, slowBlink, mediumBlink, fastBlink
  LevelSetting = array[north..west, BlinkLights]

var
  level: LevelSetting

level[north] = on
level[south] = slowBlink
level[east] = fastBlink

echo repr(level)
echo low(level)
echo len(level)
echo high(level)

type
  LightTower = array[1..10, LevelSetting]

var
  tower: LightTower

tower[1][north] = slowBlink
tower[1][east] = mediumBlink


# ------------ Sequences ----------
var
  x: seq[int]
x = @[1, 2, 3, 3, 4, ]

for value in @[3, 4, 5]:
  echo value


for i, value in @[3, 4, 5]:
  echo "index: ", $i, ", value: ", $value


# ------------ open arrays -----------
var
  fruits: seq[string]
  capitals: array[3, string]

capitals = ["New york", "London", "Berlin"]
fruits.add("Banana")
fruits.add("Mango")

proc openArraySize(oa: openArray[string]): int =
  oa.len

assert openArraySize(fruits) == 2
assert openArraySize(capitals) == 3


# ----------- varargs ----------------------
proc myWriteLn(f: File, a: varargs[string]) =
  for s in items(a):
    write(f, s)
  write(f, "\n")

myWriteLn(stdout, "abc", "def", "xyz")
myWriteLn(stdout, ["abc", "def", "xyz"])

myWriteLn(stdout, [$123, $"abc", $4.0])


# -------- slices -------------
var
  a = "Nim is a programming languaget"
  b = "Slices are useless"

echo a[7..12]
b[11..^2] = "useful"
echo b

# ------------ objects -------------------
type
  Person = object
    name: string
    age: int

var person1 = Person(name: "Peter", age: 30)

echo person1.name
echo person1.age
var person2 = person1

person2.age += 14
person1.age += 11

echo person1.age # 30
echo person2.age # 44


# doAssert person2.name == ""

type
  Person5* = object
    name*: string
    age*: int

# -------- tuples -------------
type
  Person11 = tuple
    name: string
    age: int
  PersonX = tuple[name: string, age: int]
  PersonY = (string, int)


echo "-----tuples------"
import os

let
  path = "../tut_1/nodemon.json"
  (dir, name, ext) = splitFile(path)
  baddir, badname, badext = splitFile(path)

echo dir
echo name
echo ext

echo baddir
echo badname
echo badext



