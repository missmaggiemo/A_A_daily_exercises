# stock-picker

min = array[0]
min_idx = 0
best_days = []
best_diff = 0

array.each_with_index do |el, i|
  if el < min
    min = el
    min_idx = i
  elsif (el - min) > best_diff
    best_diff = el - min
    best_days = [min_idx, i]
  end
end

return best_days
