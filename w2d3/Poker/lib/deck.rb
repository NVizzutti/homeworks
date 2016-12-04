require_relative 'card'

class Deck
  attr_accessor :cards

  def self.create_deck
    cards = []
    values = [:ace, :two, :three, :four, :five, :six, :seven,
       :eight, :nine, :ten, :jack, :queen, :king]
    suits = [:hearts, :spades, :clubs, :diamonds]
    values.each do |value|
      suits.each do |suit|
        cards << Card.new(suit, value)
      end
    end
    cards
  end


  def initialize
    @cards = Deck.create_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal(player, num)
    num.times do
      player.hand.cards << @cards.shift
    end
    p "dealt!"
  end

end
