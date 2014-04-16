class KnightMove

  KNIGHT_MOVES = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]

  attr_accessor :position, :parent, :children

  def initialize(x_y_pos)
    @position = x_y_pos
    @parent = nil
    @children = []
  end

  def to_s
    @position.to_s
  end

  def add_move(knight_move)
    self.children << knight_move
    knight_move.parent = self
  end

  def new_move_positions
    # return array of possible positions
    new_positions = KNIGHT_MOVES.map {|x,y| x, y = x + self.position[0], y + self.position[1] }

    new_positions.select! { |x, y| x <= 7 && x >= 0 && y <= 7 && y >= 0 }

    # new_positions.select! {|move| self.check_parents(pos) }

    new_positions.each do |pos|
      # new_pos = KnightMove.new(pos)
      # p self.dfs(pos)
      self.add_move(KnightMove.new(pos)) unless self.reverse_scrawny_dfs(pos)
    end

    self.children
  end

  # def check_parents(knight_move) # this gets called on the original position, taking in a new position to be checked against ancestors
#     p knight_move
#
#     return true if self.parent.nil?
#
#     if self.position == knight_move.position
#       return false
#     else
#       check_parents()
#     end
#   end

  def reverse_scrawny_dfs(position)
    return true if self.position == position
    return false if self.parent.nil?

    self.parent.dfs(position)

    #
    # self.children.each do |child|
    #   search = child.dfs(position)
    #   # child has no children? && child.value != value go back to parent and go to next child
    #   return search if search
    # end
    # nil
  end

end

# load 'knight_moves.rb'
# move0 = KnightMove.new([0,0])
# move1 = KnightMove.new([1,2])
# move2 = KnightMove.new([3,3])
#
# move0.add_move(move1)
#
# move1.add_move(move2)
# move2.new_move_positions