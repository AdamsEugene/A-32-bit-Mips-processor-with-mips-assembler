function filterEmpty(a)
  out = []
  total = []
  if length(split(a, "[")) > 1
    global arrayType *= 0
    op = split(a, "[")[1]
    op = strip(op)
    a = split(a, "[")
    a = split(a[2], "]")
    T = join(split(a[1], ","), " ")
    T = split(T, " ")
    for i in T
      if !isequal(i, "")
        push!(total, i)
      end
    end
    global arrayTotal *= length(total)
    rest = strip(split(a[2], ",")[2])
    rest = join(split(rest, ")"))
    rest1, rest2 = split(rest, "(")
    push!(out, op, a[1], rest1, rest2)
  else
    global arrayType *= 1
    global arrayTotal *= length(total)
    a = join(split(a, ","), " ")
    a = join(split(a, ")"), " ")
    a = join(split(a, "("), " ")
    for i in 1:length(split(a, " "))
      if isequal(split(a, " ")[i], "")
        continue
      else
        push!(out, split(a, " ")[i])
      end
    end
  end
  return [out, arrayType, arrayTotal]
end
