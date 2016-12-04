require_relative 'hand'

class Player

  attr_accessor :name, :hand

  def initialize(name, pot = 0)
    @name = name
    @pot = pot
    @hand = Hand.new
  end

  def swap_cards(arr)
    #replaced_cards =
    @hand.cards.reject!.with_index {|card, idx| card if arr.include?(idx) }
    arr.length
  end

end

# deck = Deck.new
# deck.shuffle!
# bobby = Player.new("bobby", 10000)
# deck.deal(bobby,5)
# bobby.hand.calc_score
# bobby.hand.to_s
# bobby.swap_cards([1,2])
# deck.deal(bobby, 2)
# bobby.hand.calc_score
# bobby.hand.to_s
