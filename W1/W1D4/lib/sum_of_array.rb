class Array

  def sum_recursive
    raise "Array but be integers." if self.any? {|el| ('a'..'z').to_a.include?(el)}

    return self.first if self.length < 2

    self.first + self[1..(self.length-1)].sum

  end

  def sum_iterative
    sum = 0
    self.each {|n| sum += n}
    sum
  end

end