def stock_picker(stock_prices)
  raise "Need at least two days to determine profit" if stock_prices.length < 2

  best_days = []
  best_diff = nil

  stock_prices.each_with_index do |price, price_i|
    ((price_i + 1)...stock_prices.length).each do |next_i|
      diff = stock_prices[next_i] - price
      if best_diff.nil? || stock_prices[next_i] - price > best_diff
        best_days, best_diff = [price_i, next_i], diff
      end
    end
  end

  best_days

end