require 'tdd'

describe '#my_uniq' do

  it 'returns an empty array if self is empty' do
    expect([].my_uniq).to eq([])
  end

  it 'returns uniq elements of array' do
    expect([1,2,3,3].my_uniq).to eq([1,2,3])
  end

  it 'returns uniq elements in order' do
    expect([3,1,2,2].my_uniq).to_not eq([1,2,3])
  end

  it 'doesnt call existing uniq method' do
    # expect([1,2,3].my_uniq).to_not receive()
  end
end

describe '#my_transpose' do
 array = [ [1, 2, 3], [6, 4, 7], [0, 8, 5]]
  it 'transposes a square matrix' do
    expect(array.my_transpose).to eq(array.transpose)
  end

  it 'doesnt call built in transpose method' do
    expect(array).not_to receive(:transpose)
    array.my_transpose
  end

end

describe '#stock_picker' do
  stocks = [1, 3, 5, 4, 2, 1, 5]
  it 'gives us the most money' do
    expect(stock_picker(stocks)).to eq([0,2])
  end
end


describe Hanoi do
  subject(:discs) { Hanoi.new() }
  it 'doesnt allow illegal stacks' do
    discs.board = [ [3], [2], [1] ]
    expect{ discs.move([1,2]) }.to raise_error('Illegal Move')
    #discs.move([1,2])
  end
end
