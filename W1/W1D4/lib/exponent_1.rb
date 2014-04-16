def exponent(base, power)
  puts "hello!"
  return 1 if power == 0
  return base * exponent(base, power-1)
end