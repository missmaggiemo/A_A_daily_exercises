# def fibonacci(n, fib=[1,1])
#   return fib[0,n] if n <= 2
#   return fib if fib.length == n
#
#   fib << fib[-1] + fib[-2]
#   fibonacci(n, fib)
# end

# nth fibo number
# def fibonacci(n)
#   return 1 if n <= 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

def fibo_arr(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  prev = fibo_arr(n - 1)
  prev << prev[-1] + prev[-2]
end



# def fibonacci(n)
#   first = 1
#   second = 1
#   fib_solution = [1,1]
#
#   if n == 1
#     return [1]
#   end
#
#   if n == 2
#     return[1,1]
#   end
#
#   until fib_solution.length == n
#     third = first + second
#     first = second
#     second = third
#     fib_solution << third
#   end
#
#   fib_solution
# end

