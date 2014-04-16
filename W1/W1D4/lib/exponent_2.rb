def exp(n, exponent)
  puts "hello?"
  return 1 if exponent == 0
  if exponent.even?
    exp(n, exponent / 2) ** 2
  else
    n * exp(n, (exponent - 1) / 2) ** 2
  end
end