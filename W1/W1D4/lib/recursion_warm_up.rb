# def range(start, finish, arr=[])
#   arr << start
#   return arr if start == finish
#   range(start + 1, finish, arr)
#   # arr = []
#   # take start
#   # arr << start
#   # start += 1
#   # arr << start
#   # ...
#   # return arr if start == finish
# end


def range(start, finish)
  arr = [start]
  # p "At beginning,start= #{start}."
  if start == finish
    # puts("Recursion ended!")
    return arr
    # this won't return until start == finish
  end
  arr + range(start + 1, finish)
  # arr + range(start + 1, finish)
  # basically, while start < finish, [start + 1] is going to be added to arrary
end

# all the start + 1 's are hanging out in memory until range(start, finish) returns a concrete value-- giving it a base


# def range(start, finish)
#
#   arr = []
#   # every time we call range, arr is sreset to []
#
#   if start == finish
#     arr << start
#     return arr
#   else
#     start += 1
#     range(start, finish)
#   end
#
# end