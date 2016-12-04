require 'deck'

describe Deck do
  subject (:deck) { Deck.new }
  it 'it has 52 cards' do
    expect(deck.cards.count).to eq(52)
  end

  it 'doesnt have dupes' do
    expect(deck.cards.uniq).to eq(deck.cards)
  end

  it '4 suits' do
    out = []
    deck.cards.each { |el| out << el.suit unless out.include?(el.suit) }
    expect(out.length).to eq(4)
  end

  it 'has thirteen card values' do
    out = []
    deck.cards.each { |el| out << el.value unless out.include?(el.value) }
    expect(out.length).to eq(13)
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      unshuffled = deck.cards.dup
      expect(deck.shuffle!).not_to eq(unshuffled)
    end
  end

  describe '#deal' do
    let(:hand) { double('name', cards: []) }
    it 'gives 5 cards to player' do
       #expect(deal).to receive(:hand)
       deck.deal(hand)
       expect(hand.cards.length).to eq(5)
     end
  end
end
