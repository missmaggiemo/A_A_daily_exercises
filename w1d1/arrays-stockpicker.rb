def stock_pickler(stockarray)

  i = 0
  j = 0
  bestdays = [0, 0]


  begin

    j = i
    begin


      j = j + 1
    end while (j < stockarray.length)


    i = i + 1
  end while (i < stockarray.length)


end



def stock_pickler(stockarray)
  best_difference = 0
  best_days = []

  stockarray.each_index do |i|
    stockarray.each_index do |j|
      if stockarray[j] - stockarray[i] > best_difference && j > i
        best_days = [i,j]
        best_difference = stockarray[j] - stockarray[i]
      end
    end
  end

  return best_days

end
