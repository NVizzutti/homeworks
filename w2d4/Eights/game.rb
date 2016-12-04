require_relative 'player'
require_relative 'hand'
require_relative 'deck'

class Game
  attr_reader :deck, :player1, :player2, :stack, :name
  attr_accessor :suit 
  def initialize
    @deck = Deck.new
    @stack = @deck.take(1)
    @player1 = Player.new('name', @deck, @stack)
    @player2 = Player.new('name2', @deck, @stack)
    @current_player = @player1
    @suit = nil
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else @current_player = @player1
    end
  end

  def update_stack_suit(new_stack, new_suit)
    @player1.stack = new_stack
    @player2.stack = new_stack
    @player1.suit = new_suit
    @player2.suit = new_suit
    @stack = new_stack
    @suit = new_suit

  end

  def play
    10.times do
      puts "Current Player : #{@current_player.name}"
      new_stack_suit = @current_player.take_turn
      update_stack_suit(new_stack_suit[0], new_stack_suit[1])
      switch_players
    end
  end



end
