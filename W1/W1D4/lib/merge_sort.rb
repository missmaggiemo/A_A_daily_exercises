def merge_sort(array)
  if array.length <= 1
    return array
  end

  # if array.length == 2
  #   case array[0] <=> array[1]
  #     when -1
  #       return array
  #     when 0
  #       return array
  #     when 1
  #       return array.reverse
  #     end
  #   end

  mid = array.length/2
  left = array[0..mid]
  right = array[mid+1..-1]
  merge(merge_sort(left), merge_sort(right))
  #
  # sorted_left =  merge_sort(left)
  # sorted_right = merge_sort(right)
  #
  # [sorted_left] + [sorted_right]
  #
  # p "Sorted left = #{sorted_left}"
  # p "Sorted right = #{sorted_right}"
  # p array
  #
end

def merge(arr1, arr2)

end