require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # attr_reader :cards
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = []
    Card.values.each do |value|
      Card.suits.each do |suit|
        break if deck.length == 52
        deck << Card.new(suit, value)
      end
    end
    deck.shuffle
  end

  def initialize(cards=nil)
    @cards = Deck.all_cards if cards.nil?
    @cards = cards unless cards.nil?
  end

  # Returns the number of cards in the deck.
  def count
    @cards.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    taken_cards = []
    n.times do
      raise "not enough cards" if @cards.empty?
      taken_cards << @cards.shift
    end
    taken_cards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(more_cards)
    more_cards.each { |card| @cards.push(card) }
    @cards
  end
end
