module Print

  def self.super_print(string, options={})
    init_variables(options)
    modified_string = modify(string.dup)
    print(modified_string)
    string
  end

  private

  def self.init_variables(options)
    @times = options[:times] || 1
    @upcase = options[:upcase] || false
    @reverse = options[:reverse] || false
  end

  def self.modify(string)
    string.upcase! if @upcase
    string.reverse! if @reverse
    string
  end

  def self.print(string)
     @times.times {puts string}
  end

end