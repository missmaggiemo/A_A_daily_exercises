class Array

  def my_uniq
    new_arr = []

    self.each do |el|
      new_arr << el unless new_arr.include?(el)
    end
    new_arr
  end

  def two_sum
    return [] if self.count <= 1
    zero_sum_indexes = []
    self.each_with_index do |el, i|
      ((i+1)...self.count).each do |j|
        if el + self[j] == 0
          zero_sum_indexes << [i, j]
        end
      end
    end
    zero_sum_indexes

  end

end