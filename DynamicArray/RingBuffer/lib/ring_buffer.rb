require_relative "static_array"
require 'byebug'
class RingBuffer
  attr_accessor :length, :store, :start_idx, :end_idx

  def initialize(capacity=8)
    @store = StaticArray.new(capacity)
    @length = 0
    @start_idx = 0
    @end_idx = 0
    @capacity = capacity
  end

  # O(1)
  def [](index)
    mid_idx = (start_idx + index) % capacity
    raise 'index out of bounds' if index >= length || index < 0
    self.store[mid_idx]
  end

  # O(1)
  def []=(index, val)
    mid_idx = (start_idx + index) % capacity
    raise 'index out of bounds' if index >= length || index < 0
    self.store[mid_idx] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if length == 0
    self[length - 1], el = nil, self[length - 1]
    self.length -= 1

    return el
  end

  # O(1) ammortized
  def push(val)
    resize! if self.capacity == self.length
    self.length += 1
    self[length - 1] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if length == 0
    el, self[0] = self.first, nil
    self.start_idx = (self.start_idx + 1) % self.capacity
    self.length -= 1
    return el
  end

  # O(1) ammortized
  def unshift(val)
    resize! if self.length == self.capacity
    self.start_idx = (start_idx - 1) % capacity
    self.length += 1
    self[0] = val
  end

  def first
    self[0]
  end

  def last
    self[@length - 1]
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    larger_store = StaticArray.new(capacity * 2)
    for i in 0...self.length
      larger_store[i] = self[i]
    end
    self.start_idx = 0
    self.store = larger_store
    self.capacity = capacity * 2
  end
end
