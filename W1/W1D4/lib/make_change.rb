# def make_change(amount, coins=[25,10,5,1])
#
#   # extract largest coin and send the rest to make change
#   return [amount] if coins.include?(amount)
#
#   coins.each do |coin|
#     return [coin] + make_change(amount - coin) if amount / coin > 0
#   end
#
# end


def make_change(amount, coins=[25,10,5,1])

  # extract largest coin and send the rest to make change
  return [amount] if coins.include?(amount)


  max = coins.map {|coin| [(amount/coin)*coin, amount/coin]}
p max
  # for each combination of coins, I want to run this:
  coins.each do |coin|
    if (amount/coin)*coin == max
      return [coin] + make_change(amount - coin, coins) if amount / coin > 0
    end
  end

  # and then I want to store

end
