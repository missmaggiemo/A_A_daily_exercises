def exp(n, exponent)
  return 1 if exponent == 0
  n * exp(n, (exponent - 1))
end

def exp(n, exponent)
  return 1 if exponent == 0
  if exponent.even?
    exp(n, exponent / 2) * exp(n, exponent / 2)
  else
    n * exp(n, (exponent - 1) / 2) * exp(n, (exponent - 1) / 2)
  end
end