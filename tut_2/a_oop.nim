{.experimental: "notnil"}

echo "----------- OOP ------------"
echo "INHERITANCE"

type Person = ref object of RootObj 
    name*: string
    age: int

type Student = ref object of Person not nil
    id: int
  
var
  student: Student
  person: Person

proc p(x: Student) =
  echo "not nil"

p(nil)

var x: Student
p(x)

# assert(student of Student)
# echo student[]  # This dereferences the student object


echo "MUTUALLY RECURSIVE TYPES"
type
  Node = ref object   # a reference to an object with the following field:
    le, ri: Node      # left, right subtrees
    sym: ref Sym      # leaves contain a reference to Sym

  Sym = object
    name: string      # a symbol
    line: int         # symbol's name
    code: Node        # symbol's abstract syntax tree

echo "TYPE CONVERSIONS"

proc getID(x: Person): int =
  Student(x).id


echo "OBJECT VARIANTS"
type
  NodeKind = enum
    nkInt,
    nkFloat,
    nkString,
    nkAdd,
    nkSub,
    nkIf
  Node2 = ref object
    case kind: NodeKind
    of nkInt: intVal: int
    of nkFloat: floatVal: float
    of nkString: strVal: string
    of nkAdd, nkSub:
      leftOp, rightOp: Node2
    of nkIf:
      condition, thenPart, elsePart: Node2
    
var n = Node2(kind: nkFloat, floatVal: 1.0)

# field ERROR!!
# n.strVal = ""

 