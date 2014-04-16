require 'rspec'
require 'transpose'

describe "my_transpose" do

  it "handles an empty array" do
    expect(my_transpose([])).to eq([])
  end

  it "transposes a square matrix" do
    expect(my_transpose([[1, 2], [3, 4]])).to eq([[1, 3], [2, 4]])
  end

  it "transposes a non-square matrix" do
    expect(my_transpose([[1, 2, 3], [4, 5, 6]])).to eq([[1,4], [2,5], [3,6]])
  end

  it "raises error if input isn't a matrix" do
    expect {
      my_transpose([[1, 2, 3], [4, 5]])
    }.to raise_exception "Not a matrix"
  end

end
