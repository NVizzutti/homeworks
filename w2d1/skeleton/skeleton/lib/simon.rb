class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
      show_sequence
      input = require_sequence
      @game_over = true unless input == @seq
      round_success_message
      @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts @seq.join(" | ")
  end

  def require_sequence
    puts "Enter next sequence"
    user_sequence = gets.chomp
    parsed_input = user_sequence.split(/\s+/)
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Correct! Prepare for next sequence..."

  end

  def game_over_message
    puts "Wrong! Answer was: #{@seq}"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

new_game = Simon.new
new_game.play
