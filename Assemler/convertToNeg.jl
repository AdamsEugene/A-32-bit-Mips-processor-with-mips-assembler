function convertToNeg(o)
  if isequal('-', o[1])
    neg = findfirst("1", o)[1] - 2
    if isequal(neg, 0)
      out = o
    else
      out = "$("1"^neg)$(o[(neg +2): end])"
    end
  else
    out = o
  end
  return out
end
