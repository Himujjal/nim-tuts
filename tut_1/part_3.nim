echo "---------- Part 3 ----------"

echo "---- References and pointer types ---- "
echo "~~TRACED REFERENCES~~"
type
  Node = ref object
    le, ri: Node
    data: int

var
  n: Node

new(n)
n.data = 9

echo n.data

echo "~~PROCEDURAL TYPES~~"
proc echoItem(x: int) = echo x

proc forEach(action: proc (x: int)) =
  const data = [2, 3, 5, 7, 11]
  for d in items(data):
    action(d)

forEach(echoItem)


echo "~~MODULES~~"
import moduleA
import moduleB

when isMainModule:
  assert(@[1, 2, 3] * @[1, 2, 3] == @[1, 4, 9])
  # assert($moduleA.x == "x")


proc x*(a: int): string = $a
proc x*(a: string): string = $a


