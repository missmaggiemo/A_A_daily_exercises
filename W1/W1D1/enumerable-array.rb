class Array
  def my_each_block
    raise "gimme a block" unless block_given?

    self.length.times do |i|
      yield self[i]
    end
    self
  end

  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
    self
  end
end

# [1,2,3].each { |item| puts item }


# do |item|
#   puts item
# end
