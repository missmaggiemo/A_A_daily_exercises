class Array
  def two_sum
    newArray = []

    self.each_index do |i|
      self.each_index do |j|
        newArray << [i, j].sort! if self[i] + self[j] == 0 && i != j
      end

    end

    return newArray.uniq
    # newArray = []
    #
    # self.each_index do |i|
    #   break if i == self.length - 2
    #   (i + 1).upto self.length do |j|
    #       newArray << [i, j] if self[i] + self[j] == 0
    #   end
    # end
    # return newArray
  end
end