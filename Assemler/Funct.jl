base = 2
op_fu = 6
imm = 16
addr = 26
funct = string(0, base = base, pad = op_fu)
Funct = Dict(
  "sll" => string(0, base = base, pad = op_fu),
  "srl" => string(2, base = base, pad = op_fu),
  "sra" => string(3, base = base, pad = op_fu),
  "sllv" => string(4, base = base, pad = op_fu),
  "srlv" => string(6, base = base, pad = op_fu),
  "srav" => string(7, base = base, pad = op_fu),
  "jr" => string(8, base = base, pad = op_fu),
  "jalr" => string(9, base = base, pad = op_fu),
  "mfhi" => string(16, base = base, pad = op_fu),
  "mthi" => string(17, base = base, pad = op_fu),
  "mflo" => string(18, base = base, pad = op_fu),
  "mtlo" => string(19, base = base, pad = op_fu),
  "add" => string(32, base = base, pad = op_fu),
  "addu" => string(33, base = base, pad = op_fu),
  "sub" => string(34, base = base, pad = op_fu),
  "subu" => string(35, base = base, pad = op_fu),
  "and" => string(36, base = base, pad = op_fu),
  "or" => string(37, base = base, pad = op_fu),
  "xor" => string(38, base = base, pad = op_fu),
  "nor" => string(39, base = base, pad = op_fu),
  "slt" => string(42, base = base, pad = op_fu),
  "sltu" => string(43, base = base, pad = op_fu),
)
