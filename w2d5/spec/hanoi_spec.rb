require 'rspec'
require 'hanoi'

describe Hanoi do

  describe "::disks" do

    it 'should return an array of disks' do
      expect(Hanoi.disks).to eq([3,2,1])
    end

  end

  describe "::stacks" do

    it 'should return an array of array with disks' do
      expect(Hanoi.stacks).to eq([ [3,2,1], [], [] ])
    end

  end

  subject(:game) {Hanoi.new}

  describe "new game" do

    it "responds to stacks" do
      expect(game.stacks).to eq([ [3,2,1], [], [] ])
    end

  end

  describe "#move_disk" do
    # we ask the player, what disk do you want to move? where do you want to move it to... blah.
    it "moves disk from start position to end position" do
      expect(game.move_disk(0, 1)).to eq([ [3,2], [1], [] ])
    end

    it "raises error for large disk ontop of small disk" do
      game.move_disk(0, 1)

      expect{

        game.move_disk(0, 1)

      }.to raise_exception
    end

    it "raises error for moving too far" do

      expect{

        game.move_disk(0, 2)

      }.to raise_exception
    end

  end

  describe '#won?' do

    it 'returns false unless all disks are in the last stack
       in descending order' do
      game.stacks = [[3],[2],[1]]
      expect(game.won?).to eq(false)
    end

    it 'returns true when all disks are in the last stack in descending
        order' do
      game.stacks = [[],[],[3,2,1]]
      expect(game.won?).to be_true
    end

    it 'returns false if there are any disks in other stacks' do
      game.stacks = [[0], [], [3,2,1]]
      expect(game.won?).to eq(false)
    end
  end

  describe '#transform_user_input' do

    it 'raises an exception if the input does not match a stack number' do
      expect {
        game.transform_user_input('c')
      }.to raise_exception
    end

    it 'returns the corresponding array index for a stack number' do
      expect(game.transform_user_input(1)).to eq(0)
    end
  end

  describe '#play' do

    it { expect(game).to respond_to(:play) }
  end
end