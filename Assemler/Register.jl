base = 2
reg = 5

shamt = string(0, base = base, pad = reg)
Register = Dict(
  "0" => string(0, base = base, pad = reg),
  "at" => string(1, base = base, pad = reg),
  "v0" => string(2, base = base, pad = reg),
  "v1" => string(3, base = base, pad = reg),
  "a0" => string(4, base = base, pad = reg),
  "a1" => string(5, base = base, pad = reg),
  "a2" => string(6, base = base, pad = reg),
  "a3" => string(7, base = base, pad = reg),
  "t0" => string(8, base = base, pad = reg),
  "t1" => string(9, base = base, pad = reg),
  "t2" => string(10, base = base, pad = reg),
  "t3" => string(11, base = base, pad = reg),
  "t4" => string(12, base = base, pad = reg),
  "t5" => string(13, base = base, pad = reg),
  "t6" => string(14, base = base, pad = reg),
  "t7" => string(15, base = base, pad = reg),
  "t8" => string(24, base = base, pad = reg),
  "t9" => string(25, base = base, pad = reg),
  "s0" => string(16, base = base, pad = reg),
  "s1" => string(17, base = base, pad = reg),
  "s2" => string(18, base = base, pad = reg),
  "s3" => string(19, base = base, pad = reg),
  "s4" => string(20, base = base, pad = reg),
  "s5" => string(21, base = base, pad = reg),
  "s6" => string(22, base = base, pad = reg),
  "s7" => string(23, base = base, pad = reg),
  "k0" => string(26, base = base, pad = reg),
  "k1" => string(27, base = base, pad = reg),
  "gp" => string(28, base = base, pad = reg),
  "sp" => string(29, base = base, pad = reg),
  "fp" => string(30, base = base, pad = reg),
  "ra" => string(31, base = base, pad = reg),
)

# println(Register["t2"])