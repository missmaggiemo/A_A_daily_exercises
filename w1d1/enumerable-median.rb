def median(arr)
  arr = arr.sort

  # if arr.length % 2 == 0
 #  # return the average of middle two values
 #  return (arr[arr.length/2 - 1].to_f + arr[arr.length/2].to_f) / 2.0
 #  else
 #  # return the middle value
 #  return arr[arr.length/2]
 #  end

  arr.length.even? ? (arr[arr.length / 2 - 1] + arr[arr.length / 2]) / 2.0 :
   arr[arr.length / 2]

end
