require 'rspec'
require 'stock_picker'

describe 'stock_picker' do

  it 'raises an error when given less than two days stock prices' do
    expect {
      stock_picker([1])
    }.to raise_exception 'Need at least two days to determine profit'
  end

  it 'returns an array with the index of the best buy day and best sell day' do
    expect(stock_picker([5,1,3])).to eq([1,2])
  end

  it 'returns the least unprofitable days when the stock price keeps falling' do
    expect(stock_picker([5,4,2])).to eq([0,1])
  end

end