require 'card'

describe Card do
  subject(:card) { Card.new(:heart, :three) }
  it 'initializes with suit and value' do
    expect(card.value).to eq(:three)
    expect(card.suit).to eq(:heart)
  end

  it 'it must initialize with a symbol' do
    expect(card.value).to be_a(Symbol)
    expect(card.suit).to be_a(Symbol)
  end

  it 'raises an error with wrong data type' do
    expect{ Card.new(5, "heart") }.to raise_error(ArgumentError)
  end


end
