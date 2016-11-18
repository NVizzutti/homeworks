class Ghost
  attr_accessor :dictionary
  def initialize(dictionary_filename)
    @dictionary = File.readlines(dictionary_filename)
    @player_one = Player.new('Me', @dictionary)
    @player_two = PCplayer.new('PC', @dictionary)
    @current_player = @player_one
    @over = false
    @main_string = ''
  end

  def play
    until @over
      puts "word is #{@main_string}"
      take_turn(@current_player)
      if @current_player == @player_one
        @current_player = @player_two
      else @current_player = @player_one
      end
      if @dictionary.select {|word| word.match(@main_string)}.length < 0
        print "This is not a word! #{@current_player.name} loses!"
          @over = true
        break
      end
    end
  end



  def take_turn(current_player)
    @current_player.main_string = @main_string
    @main_string += current_player.add_letter
    if dictionary.include?(@main_string)
      return "#{@current_player.name} loses"
      @over = true
    end
  end

end

class PCplayer
  attr_accessor :name, :main_string
  def initialize(name, dictionary)
    @name = name
    @dictionary = dictionary
    @main_string = main_string
  end

  def add_letter
    temp_dictionary = @dictionary.select do |word|
      word[@main_string.length - 1] == @main_string[-1]
    end
    word = temp_dictionary.sort_by(&:length).last
    letter = word[@main_string.length]
  end
end

class Player < PCplayer
  def add_letter
    puts 'Choose a letter'
    letter = gets.chomp
    if !('a'..'z').include?(letter.downcase)
      puts 'Invalid'
      self.add_letter
    end
    return letter
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Ghost.new('dictionary.txt')
  game.play
end
