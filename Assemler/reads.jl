using FileIO
using DataFrames
using DelimitedFiles
# using CSV
using ApplicationBuilder
using Observables

# using QML
# using Queryverse

include("Initial.jl")
include("Opcode.jl")
include("Funct.jl")
include("Register.jl")
include("Labels.jl")
include("Encode.jl")

output = append!(storeWords, datas)
show(output, allcols = true, allrows = true)

size(output, 1)
result = [
    output.opcode 
    output.rs 
    output.rt 
    output.rd 
    output.shamt 
    output.funct
]

length(result)
result = join(result)
length(result)
include("write.jl")

# readlines("InstructionBin.txt")
# readlines("InstructionHex.txt")
# writedlm("outInstr.txt", result)
# CSV.write(
#   "outInstr.txt",
#   datas,
#   append = false,
#   quotestrings = false,
#   writeheader = false,
#   delim = ''',
#   bom = false,
# )
# bytes2hex("343343565768989", base = 16)
# A = (0 x 02954020)
