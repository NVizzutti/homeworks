require_relative 'player'
require_relative 'deck'

class Game

  attr_accessor :player1, :deck
  def initialize
    @player1 = Player.new("bobby")
    #@player2 = Player.new("flay")
    @deck = Deck.new
    @deck.shuffle!
    take_turn(@player1)
  end

  def take_turn(current_player)
    @deck.deal(current_player, 5)
    current_player.hand.calc_score
    current_player.hand.to_s
    puts "would you like to swap any cards?"
    input = gets.chomp.split(",").map(&:to_i)
    current_player.swap_cards(input)
    @deck.deal(current_player, input.length)
    current_player.hand.calc_score
    current_player.hand.to_s
  end
end

test = Game.new
