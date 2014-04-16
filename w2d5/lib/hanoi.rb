class Hanoi

  def self.disks
    [3,2,1]
  end

  def self.stacks
    [self.disks, [], []]
  end

  attr_accessor :stacks
  # init
  def initialize
    @stacks = Hanoi.stacks
  end

  def play
    until won?
      begin
        display_stacks
        start_pos = transform_user_input(get_start_pos_from_user)
        end_pos = transform_user_input(get_end_pos_from_user)
        move_disk(start_pos, end_pos)
      rescue => e
        puts e
        retry
      end
    end
    puts "You win!"
  end

  def move_disk(start_pos, end_pos)
    raise "Move too far" if (start_pos - end_pos).abs > 1
    unless stacks[end_pos].empty?
      raise "Invalid move" if stacks[start_pos].last > stacks[end_pos].last
    end
    stacks[end_pos] << stacks[start_pos].pop
    stacks
  end

  def won?
    stacks == Hanoi.stacks.reverse
  end

  def display_stacks
    stacks.each_with_index do |stack, stack_i|
      puts "Stack number" + (stack_i + 1).to_s + ":"
      puts stack.to_s
    end
  end

  def get_start_pos_from_user
    puts "Please enter starting stack"
    gets.chomp.to_i
  end

  def get_end_pos_from_user
    puts "Please enter target stack"
    gets.chomp.to_i
  end

  def transform_user_input(user_pos)
    raise "Invalid input" unless [1,2,3].include?(user_pos)
    user_pos - 1
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Hanoi.new
  game.play
end