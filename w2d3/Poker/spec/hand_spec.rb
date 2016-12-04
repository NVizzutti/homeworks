require 'hand'

describe Hand do
  let(:player) { double("timmy") }
  subject(:hand) { Hand.new(player) }

  it "checks for straight" do
    hand.cards = [Card.new(:hearts, :five), Card.new(:spades, :three), Card.new(:clubs, :two), Card.new(:spades, :ace), Card.new(:diamonds, :four)]
    expect(hand.straight_check?).to be_truthy
  end

  it "checks for flush" do
    hand.cards = [Card.new(:hearts, :five), Card.new(:hearts, :three), Card.new(:hearts, :two), Card.new(:hearts, :ace), Card.new(:hearts, :four)]
    expect(hand.flush?).to be_truthy
  end

  it "returns :three_of_a_kind for 3 of a kind hands" do
    hand.cards = [Card.new(:hearts, :five), Card.new(:hearts, :five), Card.new(:hearts, :five), Card.new(:hearts, :ace), Card.new(:hearts, :four)]
    expect(hand.calc_score).to eq([:three_of_a_kind, :five])
  end
end
