include("df.jl")
include("filterEmpty.jl")
n = 0
open("instr.txt") do f
  F = []
  # println("A"^19)
  for i in enumerate(eachline(f))
    # println(i[1], ": ", i[2])
    if length(i[2]) > 1
      push!(F, "$(i[1])_$(strip(split(i[2], "#")[1]))")
    end
  end
  split(F, " ")
  # println(F)
  for i in F
    for x in [i]
      code = split(x, "_")[2]
      if strip(split(code, ":")[1]) in keys(Labels)
        if length(strip(split(code, ":")[1])) == 1
          continue
        else
          code = (strip(split(code, ":")[2]))
        end
      else
        code = code
      end
      code = strip(split(code, ";")[1])
      code = filterEmpty(code)
      # println(code)
      if isequal(length(code), 0)
        continue
      else
        code = code
      end
      opcede = code[1]
      # println((opcede))
      # println("$(opcede)" in keys(RTYPE))
      if "$(lowercase(opcede))" in (RTYPE)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, Register[split(lowercase(code[3]), "\$")[2]])
        push!(datas.rt, Register[split(lowercase(code[4]), "\$")[2]])
        push!(datas.rd, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.shamt, shamt)
        push!(datas.funct, Funct[lowercase(code[1])])
      elseif "$(lowercase(opcede))" in (ITYPE)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        push!(datas.rs, Register[split(lowercase(code[3]), "\$")[2]])
        push!(datas.rt, Register[split(lowercase(code[2]), "\$")[2]])
        if length(split(code[4], "-")) > 1
          Immediate = bitstring(0 - parse(Int, split(code[4], "-")[2]))
          push!(datas.rd, Immediate[1:5])
          push!(datas.shamt, Immediate[6:10])
          push!(datas.funct, Immediate[11:16])
        else
          Immediate = string(parse(Int, code[4]), base = base, pad = imm)
          Immediate = bitstring(parse(Int, code[4]))[(65-imm):end]
          push!(datas.rd, Immediate[1:5])
          push!(datas.shamt, Immediate[6:10])
          push!(datas.funct, Immediate[11:16])
        end
      elseif "$(lowercase(opcede))" in (UPPER)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        push!(datas.rs, shamt)
        push!(datas.rt, Register[split(lowercase(code[2]), "\$")[2]])
        Immediate = string(parse(Int, code[3]), base = base, pad = imm)
        Immediate = bitstring(parse(Int, code[3]))[(65-imm):end]
        push!(datas.rd, Immediate[1:5])
        push!(datas.shamt, Immediate[6:10])
        push!(datas.funct, Immediate[11:16])
      elseif "$(lowercase(opcede))" in (MOVE)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, shamt)
        push!(datas.rt, shamt)
        push!(datas.rd, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.shamt, shamt)
        push!(datas.funct, Funct[lowercase(code[1])])
      elseif "$(lowercase(opcede))" in (MOVEF)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.rt, shamt)
        push!(datas.rd, shamt)
        push!(datas.shamt, shamt)
        push!(datas.funct, Funct[lowercase(code[1])])
      elseif "$(lowercase(opcede))" in (SHIFT)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, shamt)
        push!(datas.rt, Register[split(lowercase(code[3]), "\$")[2]])
        push!(datas.rd, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.shamt, bitstring(parse(Int, code[4]))[(65-reg):end])
        push!(datas.funct, Funct[lowercase(code[1])])
      elseif "$(lowercase(opcede))" in (SHIFTV)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, Register[split(lowercase(code[4]), "\$")[2]])
        push!(datas.rt, Register[split(lowercase(code[3]), "\$")[2]])
        push!(datas.rd, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.shamt, shamt)
        push!(datas.funct, Funct[lowercase(code[1])])
      elseif "$(lowercase(opcede))" in (MEMORY)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        push!(datas.rs, Register[split(lowercase(code[4]), "\$")[2]])
        push!(datas.rt, Register[split(lowercase(code[2]), "\$")[2]])
        Immediate = string(parse(Int, code[3]), base = base, pad = imm)
        Immediate = bitstring(parse(Int, code[3]))[(65-imm):end]
        push!(datas.rd, Immediate[1:5])
        push!(datas.shamt, Immediate[6:10])
        push!(datas.funct, Immediate[11:16])
      elseif "$(lowercase(opcede))" in (JUMPR)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.rt, shamt)
        push!(datas.rd, shamt)
        push!(datas.shamt, shamt)
        push!(datas.funct, Funct[lowercase(code[1])])
      elseif "$(lowercase(opcede))" in (LOGICALIMM)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        push!(datas.rs, Register[split(lowercase(code[3]), "\$")[2]])
        push!(datas.rt, Register[split(lowercase(code[2]), "\$")[2]])
        Immediate = string(parse(Int, code[4]), base = base, pad = imm)
        Immediate = bitstring(parse(Int, code[4]))[(65-imm):end]
        push!(datas.rd, Immediate[1:5])
        push!(datas.shamt, Immediate[6:10])
        push!(datas.funct, Immediate[11:16])
      elseif "$(lowercase(opcede))" in (JUMP)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        if code[2] in keys(Labels)
          # println(Labels[code[2]])
          Immediate = bitstring(Labels[code[2]])[(65-addr):end]
          push!(datas.rs, Immediate[1:5])
          push!(datas.rt, Immediate[6:10])
          push!(datas.rd, Immediate[11:15])
          push!(datas.shamt, Immediate[16:20])
          push!(datas.funct, Immediate[21:26])
        else
          Immediate = bitstring(parse(Int, code[2]))[(65-addr):end]
          push!(datas.rs, Immediate[1:5])
          push!(datas.rt, Immediate[6:10])
          push!(datas.rd, Immediate[11:15])
          push!(datas.shamt, Immediate[16:20])
          push!(datas.funct, Immediate[21:26])
        end
      elseif "$(lowercase(opcede))" in (JUMPL)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        if code[2] in keys(Labels)
          Address = string(Labels[code[2]], base = base, pad = addr)
          Address = bitstring(Labels[code[2]])[(65-addr):end]
          push!(datas.rs, Address[1:5])
          push!(datas.rt, Address[6:10])
          push!(datas.rd, Address[11:15])
          push!(datas.shamt, Address[16:20])
          push!(datas.funct, Address[21:26])
        else
          push!(datas.rs, shamt)
          push!(datas.rt, shamt)
          push!(datas.rd, shamt)
          push!(datas.shamt, shamt)
          push!(datas.funct, funct)
        end
      elseif "$(lowercase(opcede))" in (BRANCH)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        push!(datas.rs, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.rt, Register[split(lowercase(code[3]), "\$")[2]])
        if code[4] in keys(Labels)
          Immediate = 31 - n
          # println(Immediate+ Labels[code[4]])
          Immediate = bitstring(Immediate + Labels[code[4]])[(65-imm):end]
          push!(datas.rd, Immediate[1:5])
          push!(datas.shamt, Immediate[6:10])
          push!(datas.funct, Immediate[11:16])
        else
          Immediate = 31 - n
          Immediate = Immediate + parse(Int, code[4])
          Immediate = bitstring(Immediate)[(65-imm):end]
          push!(datas.rd, Immediate[1:5])
          push!(datas.shamt, Immediate[6:10])
          push!(datas.funct, Immediate[11:16])
        end
      elseif "$(lowercase(opcede))" in (BRANCHON)
        push!(datas.opcode, Opcode[lowercase(code[1])])
        push!(datas.rs, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.rt, shamt)
        Immediate = string(parse(Int, code[4]), base = base, pad = imm)
        Immediate = bitstring(parse(Int, code[4]))[(65-imm):end]
        push!(datas.rd, Immediate[1:5])
        push!(datas.shamt, Immediate[6:10])
        push!(datas.funct, Immediate[11:16])
      elseif "$(lowercase(opcede))" in (JUMPAL)
        push!(datas.opcode, Opcode["RTYPE"])
        push!(datas.rs, Register[split(lowercase(code[3]), "\$")[2]])
        push!(datas.rt, shamt)
        push!(datas.rd, Register[split(lowercase(code[2]), "\$")[2]])
        push!(datas.shamt, shamt)
        push!(datas.funct, Funct[lowercase(code[1])])
      else
        println(code, " is not a valid mips instruction")
      end
      global n += 1
    end
  end
end
datas
