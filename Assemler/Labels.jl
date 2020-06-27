Labels = Dict{String,Int64}()
container = []
open("instr.txt") do f
  F = []
  for i in enumerate(eachline(f))
    if length(i[2]) > 1
      push!(F, "$(i[1])_$(strip(split(i[2], "#")[1]))")
    end
  end
  for i in F
    code = strip(split(i, "_")[2])
    if isequal(code, "")
    else
      push!(container, code)
    end
  end
end
global count = 0
for x in container
  allCode = split(x, ":")
  if isequal(allCode[1][4], '[')
    p = split(allCode[1], "[")[2]
    pp = split(p, "]")[1]
    pp = split(pp, " ")
    count += length(pp)*2-1
  end
  if length(allCode) > 1
    if isequal(allCode[2], "") && count == 0
      Labels["$(allCode[1])"] = 0
    elseif isequal(allCode[2], "") && isequal(container[end], allCode[1]*":")
      Labels["$(allCode[1])"] = count
    elseif isequal(allCode[2], "") && count !=(0)
      Labels["$(allCode[1])"] = count -1
      count -=1
    else
      Labels["$(allCode[1])"] = count
    end
  else
    global count = count
  end
  global count += 1
end
Labels
