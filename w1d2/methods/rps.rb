module RPS
  RPS_DIR = {
    "Rock" => "Scissors",
    "Scissors" => "Paper",
    "Paper" => "Rock"
  }

  def self.run( user_choice )
    computer_choice = RPS_DIR.keys.sample
    outcome = calculate_outcome( user_choice, computer_choice )
    "#{computer_choice}, #{outcome}"
  end

  def self.calculate_outcome( user_choice, computer_choice )
    if user_choice == computer_choice
      "Draw"
    elsif RPS_DIR[ user_choice ] == computer_choice
      "Win"
    else
      "Lose"
    end
  end
end

class TextShuffle
  attr_reader :file_name

  def initialize( file_name )
    @file_name = file_name
  end
end