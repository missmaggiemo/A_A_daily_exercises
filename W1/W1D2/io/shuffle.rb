#!/usr/bin/env ruby

class TextShuffle
  attr_reader :file_name

  def initialize
    @file_name = ARGV[0]
  end

  def run
    read_file
    shuffle_lines
    write_file
  end

  private

  def read_file
    File.open(@file_name, "r") do |file|
      @lines = file.readlines
      file.close
    end
  end

  def shuffle_lines
    @lines.shuffle!
  end

  def write_file
    new_file_name = "#{@file_name.split('.').first}-shuffled.txt"
    File.open(new_file_name, "w+") do |file|
      file.puts(@lines)
      file.close
    end
  end

end


shuffle = TextShuffle.new
shuffle.run