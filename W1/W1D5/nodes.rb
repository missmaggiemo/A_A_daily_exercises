class TreeNode

  attr_accessor :parent, :children, :value

  def initialize(value, name=nil, parent=nil, children=[])
    @name = name
    @value = value
    @parent = parent
    @children = children
  end

  def to_s
    @value.to_s
  end

  def remove_node(child_node)
    child_node.parent = nil
    self.children.select! {|child| !child.parent.nil?} # remove child node
  end

  def add_node(child_node)
    child_node.parent = nil # remove child node from prev parent
    child_node.parent = self # set child's parent node to new node
    self.children << child_node # add child to parent node's children
  end

  def dfs(value)
    return self if self.value == value

    self.children.each do |child|
      search = child.dfs(value)
      # child has no children? && child.value != value go back to parent and go to next child
      return search if search
    end
    nil
  end

  def bfs(value, queue = [])
    return self if self.value == value

    self.children.each {|child| queue << child }

    first_in_queue = queue.shift

    if first_in_queue.nil?
      return nil
    else
      first_in_queue.bfs(value, queue)
    end
  end

  def path
    # ...
    queue = [self]
    path_list = [self]

    loop do
      popcorn = queue.shift
      break if popcorn.parent.nil?
      path_list << popcorn.parent
      queue << popcorn.parent
    end
    path_list.reverse

  end

end
#
# load "nodes.rb"
#
# bill = TreeNode.new(10, "Bill")
# molly = TreeNode.new(5, "Molly")
# steve = TreeNode.new(1, "Steve")
# alex = TreeNode.new(2, "Alex")
# luke = TreeNode.new(8, "Luke")
# becky = TreeNode.new(6, "Becky")
# alice = TreeNode.new(3, "Alice")
#
# bill.add_node(molly)
# bill.add_node(steve)
#
# steve.add_node(alex)
# steve.add_node(luke)
#
# molly.add_node(becky)
# becky.add_node(alice)