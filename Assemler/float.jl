num = "0.1610"
number = num[1] == '-' ? split(num, '-')[2] : num

realnum, floatnum = split(number, ".")
convertReal = bitstring(parse(Int, realnum))[33:end]
cFloat = "0." * floatnum
n = 1
# FPart = bitstring(parse(Float64, cFloat))
FPart = ""
while n < 33
    C = parse(Float64, cFloat) * 2
    C = string(C)
    global FPart = FPart * split(C, ".")[1]
    nFloat = split(C, ".")[2]
    global cFloat = "." * nFloat

    global n = n + 1
end
convertFloat = FPart == "" ? 0 : FPart
R = convertReal * "." * convertFloat
first1 = findfirst("1", R)[1]
point = findfirst('.', R)[1] - 1
# Mat = (convertReal*convertFloat)[first1:end]
Sign = num[1] == '-' ? "1" : "0"
if point > first1
    Exp = length(R[first1:point]) - 1 + 127
    Mat = (convertReal*convertFloat)[first1+1:end]
    Exponent = bitstring(Exp)[57:end]
    Matissa = length(Mat) >= 32 ? Mat[1:23] : Mat * "0"^(23 - length(Mat))
else
    point = findfirst('.', R)[1]
    Exp = -(length(R[point:first1]) - 1) + 127
    Mat = (convertReal*convertFloat)[first1:end]
    Exponent = bitstring(Exp)[57:end]
    Matissa = length(Mat) >= 23 ? Mat[1:23] : Mat * "0"^(23 - length(Mat))
end
floatFormat = "00101011111000101001011001011101"
bitstring(Float32(0.1))

S = floatFormat[1] == '1' ? "-" : "+"
E = floatFormat[2:9]
M = floatFormat[10:end]

FE = 0
for i = 1:length(E)
    global FE = FE + parse(Int, E[i]) * 2^(8 - i)
end
FEE = FE - 127
FM = FEE >= 0 ? "1" * M[1:FEE] : "0"
# FM = "1" * M[1:FEE]
FFM = 0
for i = 1:length(FM)
    global FFM = FFM + parse(Int, FM[i]) * 2^(length(FM) - i)
end
FFM
FP = FEE >= 0 ? M[FEE+1:end] :
    string(join(zeros(Int8, abs(FEE) - 1))) * "1" * M[1:end]
FFP, x = 0, 2
for i = 1:length(FP)
    global FFP = FFP + parse(Int, FP[i]) * 1 / x
    global x = x * 2
end
FFP
B = FFM + FFP
parse(Float64, S * string(B))


########################################################################
########################################################################
2.44 + 2.44
A = "01000000000111000010100011110101"
B = "01000000000111000010100011110101"
E1 = A[2:9]
E2 = B[2:9]
M1 = "1"*A[10:end]
M2 = "1"*B[10:end]

FEE1 = 0
for i = 1:length(E1)
    global FEE1 = FEE1 + parse(Int, E1[i]) * 2^(8 - i)
end
FEE1E = FEE1 - 127
# FM1 = FEE1E >= 0 ? "1" * M1[1:FEE1E] : "0"
FM1 = 0
for i = 1:length(M1)
    global FM1 = FM1 + parse(Int, M1[i]) * 2^(length(M1) - i)
end
FM1


FEE2 = 0
for i = 1:length(E2)
    global FEE2 = FEE2 + parse(Int, E2[i]) * 2^(8 - i)
end
FEE2E = FEE2 - 127

FM2 = 0
for i = 1:length(M2)
    global FM2 = FM2 + parse(Int, M2[i]) * 2^(length(M2) - i)
end
FM2

FM1+FM2

if isequal(FEE1E, FEE2E)

elseif FEE1E > FEE2E

else

end
#########################################################################
###########################################################################
num = Float32(0.595)
num1 = Float32(4.55)
ansa = num + num1
bitstring(num)
bitstring(num1)
bitstring((num + num1))
bitstring(Int8(126))
109+1
