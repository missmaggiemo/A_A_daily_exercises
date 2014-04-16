class GuessingGame
  def initialize
    @number = rand(100)
  end

  def play
    # init_number
    loop do
      get_input
      quit? ? break : give_feedback
      break if win?
    end
  end

  private

  def quit?
     @guess.to_s.downcase == 'quit'
  end

  def win?
    @number == normalized_input
  end

  def give_feedback
    case
      when normalized_input > @number then puts( "Too high." )
      when normalized_input < @number then puts( "Too low." )
      else puts( "That's it!" )
    end
  end

  def get_input
    puts "What's your guess? (1 - 100)"
    @guess = gets.chomp
  end

  def normalized_input
    @guess.to_i
  end

end