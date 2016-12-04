require_relative 'deck'
require_relative 'cardvalues'
class Hand
  include CardValues
  attr_accessor :cards, :score, :kicker, :multiplier

  def initialize
    @cards = []
    @score = nil
    @kicker = nil
    @multiplier = nil
    @card_multiple = nil
  end

  def calc_score
    card_values_count = Hash.new(0)
    @cards.each do |el|
      card_values_count[el.value] += 1
    end
    total_count = card_values_count.sort_by { |_, v| v }.reverse
    singletons = total_count - total_count.reject { |k, v| v < 2 }

    singletons.each do |subarr|
      @kicker ||= subarr.first
      @kicker = subarr.first if VALUE_AMOUNT[kicker] < VALUE_AMOUNT[subarr.first]
    end
      @kicker
    duplicates =  total_count.reject! { |k, v| v < 2 }

    if duplicates.empty?
      if royal_flush?
        @multiplier = :royal_flush
        return SCORES[:royal_flush]
      elsif straight_check? && flush?
        @multiplier = :straight_flush
        return SCORES[:straight_flush] * VALUE_AMOUNT[kicker]
      elsif straight_check?
        @multiplier = :straight
        return SCORES[:straight] * VALUE_AMOUNT[kicker]
      elsif flush?
        @multiplier = :flush
        return SCORES[:flush] * VALUE_AMOUNT[kicker]
      else
        @multiplier = :high_card
        return 0
      end
    end

    score_arr = calc_score_helper(duplicates)
    @multiplier = score_arr[0]
    @card_multiple = score_arr[1]
    multiply = SCORES[score_arr[0]]

    value_amt = VALUE_AMOUNT[score_arr[1]]
    multiply * value_amt

  end

  def royal_flush?
    integer_values = @cards.map { |el| VALUE_AMOUNT[el.value] }
    integer_values.sort!
    return true if integer_values == [10,11,12,13,14]
    false
  end

  def straight_check?
    integer_values = @cards.map { |el| VALUE_AMOUNT[el.value] }
    integer_values.sort!
    return true if integer_values == [2,3,4,5,14]
    integer_values[0... -1].each_with_index do |el, idx|
      idx2 = idx + 1
      return false if integer_values[idx2] - el > 1
    end
    true
  end

  def to_s
    puts @cards.join(" | ")
    puts "you have #{@multiplier} of #{@card_multiple}, #{@kicker} high"

  end

  def calc_score_helper(duplicates)
    if duplicates.length < 2
      if duplicates[0][1] == 2
        #puts "pairs of #{duplicates[0][0]}"
        return [:pair, duplicates[0][0]]
      elsif duplicates[0][1] == 3
        #puts "three of a kind #{duplicates[0][0]}"
        return [:three_of_a_kind, duplicates[0][0]]
      else
        #puts "4 of a kind #{duplicates[0][0]}"
        return [:four_of_a_kind, duplicates[0][0]]
      end
    else
      if duplicates[0][1] == 3
      #  puts "full house! #{duplicates[0][1]} full of #{duplicates[1][1]}"
        return [:full_house, duplicates[0][1]]
      elsif duplicates[1][1] == 3
      #  puts "full house! #{duplicates[1][1]} full of #{duplicates[0][1]}"
        return [:full_house, duplicates[1][1]]
      else
      #  puts "two pair #{duplicates[0][0]} #{duplicates[1][0]}"
        pair_1 = duplicates[0][0]
        pair_2 = duplicates[1][0]
        return [:two_pair, VALUE_AMOUNT[pair_1] > VALUE_AMOUNT[pair_2] ? pair_1 : pair_2]
      end
    end
  end

  def flush?
    @cards.all? { |el| el.suit == @cards[0].suit }
  end
end
