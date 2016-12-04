class Hand
  include Enumerable
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    new_hand = deck.take(5)
    Hand.new(new_hand)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def matched(stack)
    result = []
    @cards.each do |card|
      num = card.value
      if stack.last.value == num  || stack.last.suit == card.suit || card.value == :eight
        result << card
      end
    end
    result
  end

  def take_all(stack)
    @cards += stack
  end

  def remove(card)
    @cards.delete(card)
  end

  def beats?(other_hand)
    return false if self.busted? unless other_hand.busted?
    other_points = other_hand.points
    my_points = self.points
    return true if other_hand.busted?
    return true if my_points > other_points
    return false
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.map(&:to_s).join(' | ')
  end

  def each
    @cards.each do |card|
      yield(card)
    end
  end 
end
