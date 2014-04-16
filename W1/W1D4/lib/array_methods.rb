class Array

  def my_each(&block)
    # (0..(self.length-1)).each do |i|
    self.length.times do |i|
      block.call self[i]
    end

    self
  end

  #using my_each
  def my_map(&block)
    new_self = []
    self.my_each do |el|
      new_self << block.call(el)
    end
    new_self
  end

  def my_select(&block)
    new_self = []
    self.my_each do |el|
      new_self << el if block.call(el)
    end
    new_self
  end

  #
  # def my_map(&block)
  #   new_self = []
  #   self.length.times do |i|
  #     new_self << block.call(self[i])
  #   end
  #   new_self
  # end
  #
  # def my_select(&block)
  #   new_self = []
  #   self.length.times do |i|
  #     new_self << self[i] if block.call(self[i])
  #   end
  #   new_self
  # end

  def my_inject(n=self[0], &block)
    n == self[0] ? times_run = (self.length - 1) : times_run = self.length
    # desn't work when self[0].nil?
    times_run.times do |i|
      n = block.call(n, self[i+1]) unless self[i+1].nil?
    end
    n
  end

  def my_sort!(&block)
    block ||= Proc.new{|n1, n2| n1 <=> n2}

    sorted = false
    until sorted
      sorted = true
      (self.length - 1).times do |i|
        if block.call(self[i], self[i+1]) == 1
          self[i+1], self[i] = self[i], self[i+1]
          sorted = false
        end
      end
    end
    self
  end

end