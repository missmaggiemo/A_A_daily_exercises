load "nodes.rb"

class KnightPathFinder
  KNIGHT_MOVES = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]


  attr_accessor :start

  def initialize(start_pos)
    @start = TreeNode.new(start_pos)
  end

  def find_path(finish)

    @start.dfs(finish).path

  end

  def build_move_tree
    queue = [@start]
    visited = []

    until queue.empty?
      first_in_queue = queue.shift

      new_positions = KNIGHT_MOVES.map {|x,y| x, y = x + first_in_queue.value[0], y + first_in_queue.value[1] }
      new_positions.select! { |x, y| x <= 7 && x >= 0 && y <= 7 && y >= 0 }

      new_positions.each do |pos|
        next if visited.include?(pos)
        new_pos = TreeNode.new(pos)
        first_in_queue.add_node(new_pos)
        queue << new_pos
        visited << new_pos.value
      end
    end

  end



end

knight = KnightPathFinder.new([0,0])

knight.build_move_tree