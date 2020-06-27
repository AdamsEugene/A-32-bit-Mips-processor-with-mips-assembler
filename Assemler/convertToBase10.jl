function convertToBaseTen(n)
    baseTen = 0
    for i in 1:length(n)
        baseTen += parse(Int, n[i]) * 2^(length(n)-i)
    end
    return baseTen
end