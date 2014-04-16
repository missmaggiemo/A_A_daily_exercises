class Board
  INITIAL_STATE = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
  ]

  MARKS = ['x', 'o']

  attr_accessor :state

  def initialize
    @state = INITIAL_STATE
  end

  def won?( mark )
    row_win( mark )  ||
    col_win( mark )  ||
    diagonal_win( mark )
  end

  def winner
    MARKS.select { |mark| won?( mark ) }
         .first
  end

  def empty?( pos )
    @state[ pos.first ][ pos.last ].nil?
  end

  def place_mark( pos, mark )
    @state[ pos.first ][ pos.last ] = mark if empty?( pos )
  end

  private

  def row_win( mark )
    @state.map do |row|
      row.all? { |el| el == mark }
    end.any?
  end

  def col_win( mark )
    @state.transpose.map do |col|
      col.all? { |el| el == mark }
    end.any?
  end

  def diagonal_win( mark )
    get_diagonals.map do |diag|
      diag.all? { |el| el == mark }
    end.any?
  end

  def get_diagonals
    [ [@state[0][0], @state[1][1], @state[2][2]],
    [@state[0][2], @state[1][1], @state[2][0]] ]
  end
end



class Game

  def initialize
    @players = generate_players
    @board = Board.new
    @marks = Board::MARKS
  end

  def play
    loop do
      turn( @players.first )
      break if won?('x') || won?('o')
      turn( @players.last )
      break if won?('x') || won?('o')
    end
  end

  def turn( player )
    if player.human?
      display_board
      ask_for_move
      # return false if quit?
      normalize_move
    end
    make_move ( player )
    feedback
  end

  def display_board
    p @board.state
  end

  def ask_for_move
    puts "Where do you want to move?"
    @move = gets.chomp
  end

  def quit?
    @move.downcase == 'quit'
  end

  def make_move ( player )
    @move = generate_mark unless player.human?
    @board.place_mark(@move, player.mark)
  end

  def feedback
    if won?('x')
      puts "You won!"
    end
  end

  def won?( mark )
    @board.won?( mark )
  end

  def normalize_move
    @move = @move.scan(/\d/).map(&:to_i)
  end

  def generate_mark
    moves = []
    @board.state.each_index do |row|
      @board.state[row].each_index do |col|
        moves << [row, col] if @board.state[row][col].nil?
      end
    end
    moves.sample
  end

  def generate_players
    new_marks = ['x', 'o'].shuffle!
    [ ComputerPlayer.new(new_marks[0]), HumanPlayer.new(new_marks[1]) ]
  end

end



class ComputerPlayer
  attr_reader :mark

  def initialize( mark )
    @is_human = false
    @mark = mark
  end

  def human?
    @is_human
  end


end

class HumanPlayer
  attr_reader :mark

  def initialize( mark )
    @is_human = true
    @mark = mark
  end

  def human?
    @is_human
  end

  def get_move
  end

end


# col_win = [
#   ['x', nil, nil],
#   ['x', nil, nil],
#   ['x', nil, nil]
# ]
#
# row_win = [
#     ['x', 'x', 'x'],
#     [nil, nil, nil],
#     [nil, nil, nil]
#   ]
#
# diag_win = [
#     ['x', nil, nil],
#     [nil, 'x', nil],
#     [nil, nil, 'x']
#   ]



