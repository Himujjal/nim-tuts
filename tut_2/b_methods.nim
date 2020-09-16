import strutils

echo "abc".len
echo "abc".toUpperAscii()
echo({ 'a', 'b', 'c' }.card)
stdout.writeLine("Hello")



echo "PROPERTIES"
type
  Socket* = ref object of RootObj
    h: int  # cannot be accessed from the outside of the module due to missing star
  
proc `host=`*(s: var Socket, value: int) {.inline.} =
  # setter of host address
  s.h = value

proc host*(s: Socket): int {.inline.} =
  s.h

proc hello(s: var Socket, value: int, option: int): int =
  s.host +  value

var s: Socket
new s
s.host = 34

echo s.hello(2, 5)


echo "DYNAMIC DISPATCH"
type
  Expression = ref object of RootObj
  Literal = ref object of Expression
    x: int
  PlusExpr = ref object of Expression
    a, b: Expression

method eval(e: Expression): int {.base.} =
  quit "to override"


echo "--- EXCEPTIONS ---"
proc exc()=
  var
    e: ref OSError
  new(e)
  e.msg = "the request to the OS failed"
  raise e

# exc()

