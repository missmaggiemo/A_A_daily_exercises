# deep duplication of an array
def deep_dup(array)
  return [array] if array.kind_of?(Array) == false
  array.clone.each do |el|
    deep_dup(el)
  end
end



