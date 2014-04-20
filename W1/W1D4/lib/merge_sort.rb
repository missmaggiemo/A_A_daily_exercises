def merge_sort(array)
  if array.length <= 1
    return array
  end

  mid = array.length/2
  left = array[0..mid]
  right = array[mid+1..-1]
  merge(merge_sort(left), merge_sort(right))

end

def merge(arr1, arr2)
  solution_array = []

  until arr1.empty? || arr2.empty?
    if arr1[0] < arr2[0]
      solution_array << arr1.shift
    else
      solution_array << arr2.shift
    end
  end

  solution_array + arr1 + arr2

end