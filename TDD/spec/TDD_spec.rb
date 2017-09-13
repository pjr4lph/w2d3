require 'rspec'
require 'tdd'

describe '#my_uniq' do
  it 'removes duplicates' do
    expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
  end
  it 'works with many duplicates' do
    expect([3,3,3,3,3,3,3,3,3,3,3,3].my_uniq).to eq([3])
  end
end

describe "#two_sum" do
  it 'finds pairs that sum to zero' do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
  end
  it 'works with two zeros' do
    expect([1,5,0,1,5,0].two_sum).to eq([[2,5]])
  end
end

describe '#my_transpose' do
  it 'converts rows to columns' do
    expect([[0,1,2], [3,4,5], [6,7,8]].my_transpose).to eq([[0,3,6], [1,4,7], [2,5,8]])
  end
  it 'only works with squares' do
    expect{[[0,1,3,4,5],[6,7],[8,9]].my_transpose}.to raise_error("Squares only!")
  end
end

describe '#stock_picker' do
  it 'gets most profitable pair' do
    expect([10,2,5000].stock_picker).to eq([1,2])
  end
  it 'does not select any days if there is no profit' do
    expect([600, 24, 2].stock_picker).to eq([])
  end
end

describe TowerOfHanoi do
  subject(:game) { TowerOfHanoi.new }

  describe '#initialize' do
    it 'creates an array of arrays' do
      expect(game.towers).to eq([[3,2,1],[],[]])
    end
  end

  describe '#move' do
    it 'moves the top piece to the second tower' do
      game.move(0,1)
      expect(game.towers[1]).to eq([1])
    end

    it 'does not move a bigger piece on to a smaller piece' do
      game.towers = [[3],[2],[1]]
      expect{game.move(0,2)}.to raise_error("Invalid move!")
    end

    it 'does not move from an empty tower' do
      expect {game.move(1,0)}.to raise_error('No tower at start position!')
    end
  end

  describe '#won?' do
    it 'tells you if you won' do
      game.towers = [[], [], [3,2,1]]
      expect(game.won?).to be(true)
    end

    it 'returns false if you did not win' do
      expect(game.won?).to be(false)
    end
  end
end
