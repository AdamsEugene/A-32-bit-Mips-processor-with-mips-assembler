include("hex.jl")

S = size(output)[1]
i = 1
r = 5
opFu = 6
S * 5 + 241
container = []
rs = S * 6 + 1
rt = rs + 5 * S
rd = rt + 5 * S
shm = rd + 5 * S
fun = shm + 5 * S
length(result)
while i <= S * 6
  preOut = (
    result[i:opFu] *
    result[rs:(rs+4)] *
    result[rt:(rt+4)] *
    result[rd:(rd+4)] *
    result[shm:(shm+4)] *
    result[fun:(fun+5)]
  )
  push!(container, preOut)
  global i += 6
  global opFu += 6
  global rs += 5
  global rt += 5
  global rd += 5
  global shm += 5
  global fun += 6
end
(container)
writedlm("InstructionBin.txt", container)
Hex["0000"]
HexOut = []
for i in container
  Out = (
    Hex[i[1:4]]*
    Hex[i[5:8]]*
    Hex[i[9:12]]*
    Hex[i[13:16]]*
    Hex[i[17:20]]*
    Hex[i[21:24]]*
    Hex[i[25:28]]*
    Hex[i[29:32]]
  )
  push!(HexOut, Out)
end
HexOut
writedlm("InstructionHex.txt", HexOut)
