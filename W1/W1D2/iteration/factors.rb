module Factor
  class << self

    def factors1(number)
      [].tap do |factors_list|
        (1..(Math.sqrt(number).to_i + 1)).each do |n|
          if number % n == 0
            factors_list << n
            factors_list << number / n
          end
        end
      end.uniq.sort
    end

    def factors( number )
      1.upto( calculate_max_divisor( number ) ).to_a.select do |divisor|
        is_factor?( number, divisor )
      end
    end

    private

    def calculate_max_divisor( number )
      number
    end

    def is_factor?( number, divisor )
      number % divisor == 0
    end
  end
end