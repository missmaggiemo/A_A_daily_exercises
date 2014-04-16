# module Remix
#   def self.remix(drinks)
#     remixed_drinks = []
#     drinks.each_with_index do |drink, drink_i|
#       new_index = (drink_i + 1) % 3
#       remixed_drinks << [drink[0], drinks[new_index][1]]
#     end
#     remixed_drinks
#   end
#
# end

remix = [["rum", "coke"],["gin", "tonic"],["scotch", "soda"]]


module Remix
  def self.remix(drinks)
    remixed_drinks = []
    alcohols = drinks.map{ |drink| drink[0] }.shuffle
    mixers = drinks.map{ |drink| drink[1] }.shuffle

    alcohols.each_with_index do |alcohol, alc_i|
      remixed_drinks << [alcohol, mixers[alc_i]]
    end

    remixed_drinks
  end

end

