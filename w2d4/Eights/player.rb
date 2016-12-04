class Player
  attr_reader :cards, :name
  attr_accessor :stack, :suit
  def initialize(name, deck, stack)
    @name = name
    @cards = Hand.deal_from(deck)
    @stack = stack
    @deck = deck
    @suit = nil
  end

  def play_card(card)
    if card.value == :eight
      puts 'Choose a suit'
      idx = gets.chomp
      @suit = Card.suits[idx.to_i]
      @stack << card
      @cards.remove(card)
    else
      @stack << card
      @cards.remove(card)
      @suit = nil
    end
    @suit
  end

  def take_turn
    puts "Card to Match: #{@stack.last.to_s}"
    puts 'Your Hand: '
    puts @cards.to_s
    possible = @cards.matched(@stack) if @suit.nil?
    possible = @cards.select{ |card| card.suit == @suit } if !@suit.nil?
    return draw_card if possible.length < 1
    puts "Valid Cards to Play: "
    puts possible
    puts 'What card do you want to play?'
    index = gets.chomp.scan(/\d/).map(&:to_i).first
        if !possible[index].nil?
          new_suit = play_card(possible[index])
        else
          puts "Not a valid index"
          return take_turn
        end
    return [@stack, @suit]
  end

  def draw_card
    puts 'You had no valid cards and must draw'
    @cards.take_all(@deck.take(1))
    take_turn
  end

end
