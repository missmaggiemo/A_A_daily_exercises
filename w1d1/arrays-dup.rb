class Array
  def my_uniq
    [].tap do |new_array|
      self.each do |item|
        new_array << item unless new_array.include? item
      end
    end
  end
end

