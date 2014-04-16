module BubbleSort
  class << self
    def sort( array )
      loop do
        break if sort_array( array )
      end
      array
    end

    private

    def sort_array( array )
      sorted = true

      ( 1...array.length ).each do |i|
        if array[i-1] > array[i]
          array[i], array[i-1] = array[i-1], array[i]
          sorted = false
        end
      end

      sorted
    end
  end
end