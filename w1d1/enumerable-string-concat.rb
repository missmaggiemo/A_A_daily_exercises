def string_concat(arr)
  arr.inject('') { |sum, el| sum + el }
end