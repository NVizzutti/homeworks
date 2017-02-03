require_relative "static_array"
require 'byebug'
class DynamicArray
  attr_accessor :length, :store, :capacity

  def initialize(capacity=8)
    @store = StaticArray.new(capacity)
    @length = 0
    @capacity = capacity
  end

  def [](i)
    raise 'index out of bounds' if i >= @length || i < 0
    @store[i]
  end

  def []=(i, val)
    raise 'index out of bounds' if i >= @length || i < 0
    @store[i] = val
  end

  def include?(val)

  end

  def push(val)
    self.resize! if @length == @capacity
    self.length += 1
    @store[length - 1] = val
  end

  def unshift(val)
    self.length += 1
    self.resize! if @length == @capacity
    (self.length - 2).downto(0).each do |i|
      self[i + 1] = self[i]
    end
    self[0] = val
  end

  def pop
    el = self.last
    @store[@length - 1] = nil
    self.length -= 1
    el
  end

  def shift
    raise 'index out of bounds' if length == 0
    el = self[0]
    for i in 1...self.length
      self[i - 1] = self[i]
    end
    self.length -= 1
    el
  end

  def first
    self[0]
  end

  def last
    self[self.length - 1]
  end

  def each
    for i in 0...length
      yield(self[i])
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :length }

  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)
    for i in 0...self.length
      new_store[i] = self[i]
    end
    @capacity = new_capacity
    @store = new_store
  end
end
