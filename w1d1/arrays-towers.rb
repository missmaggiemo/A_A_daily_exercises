class HanoiGame
  attr_accessor :array1, :array2, :array3, :arrays, :give_up
  GIVEN_UP = "Y"
  DISK_COUNT = 4
  def initialize
    @arrays = [('a'..'d').to_a, [], []]
    @give_up = "N"
  end

  def display_board
    print "Here are your arrays:\n"
    print "1: " + self.arrays[0].to_s + "\n"
    print "2: " + self.arrays[1].to_s + "\n"
    print "3: " + self.arrays[2].to_s + "\n"
  end

  def turn
      puts "From which tower shall we move?"
      source_tower = gets.chomp.to_i - 1
      puts "Where would you like to move the disk to?"
      target_tower = gets.chomp.to_i - 1
      puts "Do you want to give up? (Y/N)"
      self.give_up = gets.chomp.upcase

      #ensure that this is a legal move...

      disk = self.arrays[source_tower].shift
    return place_disk(disk, target_tower)
  end

  def place_disk(disk, target_array)
    @arrays[target_array].unshift(disk)
  end

  def play
    until game_over?
      display_board
      turn
    end
  end

  def game_over?
    self.arrays[1].length == DISK_COUNT ||
    self.arrays[2].length == DISK_COUNT ||
    self.give_up == GIVEN_UP
  end

end