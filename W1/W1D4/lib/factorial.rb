def factorial(n)
  return n if n == 1
  n * factorial(n - 1)
end