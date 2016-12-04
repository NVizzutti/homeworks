class Card
  attr_accessor :suit, :value
  def initialize(suit, value)
    raise ArgumentError if !suit.is_a?(Symbol) || !value.is_a?(Symbol)
    @suit = suit
    @value = value
  end

  def to_s
    "#{@value} of #{@suit}"
  end
end
