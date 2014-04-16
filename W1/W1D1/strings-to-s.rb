# def num_to_s(num, base)
#   digits = []
#
#   while num > 0
#
#     digit = num % base
#     num = num / base
#
#     digits.unshift(digit.to_s)
#   end
#
#
#   return digits.join("")
#
# end


def num_to_s (num, base)
  digits = []
  power = 0

  until num / (base**power) == 0
    digits.unshift (num / (base ** power) % base).to_s
    power += 1
  end

  digits.join('')

end
