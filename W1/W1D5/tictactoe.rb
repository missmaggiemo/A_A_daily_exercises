class TicTacToeNode
  BOARD = Array.new(3, Array.new(3, []))
  MARKS = [:x, :o]

  attr_accessor :board, :child_list, :mark

  def initialize(board, mark, prev_move_pos = nil)
    @board = board
    @mark = mark
    @other_mark = MARKS.select {|m| m != @mark }.first
    @prev_move_pos = prev_move_pos
    @child_list = []
  end

  def children

    board = @board.map(&:dup)

    board.each_with_index do |row, row_i|
      row.each_with_index do |position, col_i|
        if position.empty?
          new_board = board.map(&:dup)
          new_board[row_i][col_i] = [@other_mark]
          @child_list << TicTacToeNode.new(new_board, @other_mark, [row_i, col_i])
        end
      end
    end

    @child_list

  end

  def losing_node?(player)
    return false if self.tied?(player)
    return false if self.winning_node?(player)
    true
  end

  def tied?(player)
    return false if @board.flatten.include?([]) || self.winning_node?(player)
    true
  end


  def winning_node?(player)

    @board.each do |row|
      return true if row.all? { |mark| mark == [player] }
    end

    @board.transpose.each do |column|
      return true if column.all? { |mark| mark == [player] }
    end

    diags = [[@board[0][0], @board[1][1], @board[2][2]],
              [@board[0][2], @board[1][1], @board[2][0]]]

    diag_win = diags.map do |diag|
      diag.all? {|m| m == [player]}
    end

    return true if diag_win.any?

    @child_list.each do |child|
      return child.winning_node?(player)
    end

    false

  end

end


new_board = [[[:x], [:o], [:o]],
             [[:x], [:x], [:o]],
             [[:o], [], [:x]]]

board = TicTacToeNode.new(new_board, :o)

board.children
#
# board.child_list.each {|board| p board.board}
#
# p board.child_list.length

# p board.mark
#
p board.winning_node?(:x)












