module Substrings

  def self.substrings(string)
    (1..string.length).each_with_object( [] ) do |length, subs|
      string.split('').each_index do |str_i|
        subs << string[str_i, length]
      end
    end.uniq
  end

end