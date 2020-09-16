var
  x*, y: int

proc `*` *(a, b: seq[int]): seq[int] =
  newSeq(result, len(a))
  for i in 0..len(a) - 1: result[i] = a[i] * b[i]

