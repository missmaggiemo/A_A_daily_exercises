# def bsearch(array, target, min=0, max=array.length-1)
#   p "Array: #{array}"
#   p "Min: #{min}"
#   p "Max: #{max}"
#   return nil if target < array.min || target > array.max
#
#   midpoint = array.length/2
#
#   case target <=> array[midpoint]
#     when -1
#       bsearch(array[0..midpoint], target, min=min, max=midpoint)
#     when 0
#       return min + midpoint
#     when 1
#       bsearch(array[midpoint..max], target, min=midpoint, max=max)
#   end
#
# end



def bsearch(array, target)
  return nil if array.empty?

  midpoint = array.length / 2

  case target <=> array[midpoint]
  when -1
    bsearch(array[0..midpoint], target)
  when 0
    midpoint
  when 1
    bsearch(array.drop(midpoint), target) + midpoint
  end
end