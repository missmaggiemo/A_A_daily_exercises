require 'rspec'
require 'arrays'

describe Array do

  describe '#my_uniq' do

    it "returns an array with duplicate values removed" do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end

  end

  describe '#two_sum' do

    it "returns empty array for no 0-sum positions" do
      expect([-1, 0, 2].two_sum).to eq([])
    end

    it "returns 0-sum positions" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
    end

    it "doesn't include the same index, e.g., [0,0]" do
      expect([0].two_sum).to eq([])
    end

  end

end