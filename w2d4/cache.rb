class LRUCache
  def initialize(size)
    @size = size
    @max = size
    @store = []
  end

  def count
    @store.count
    # returns number of elements currently in cache
  end

  def add(el)
    if @store.include?(el)
      @store.delete(el)
      @store << el
    elsif @store.count < @max
      @store << el
    else
      @store.shift
      @store << el
    end
    # adds element to cache according to LRU principle
  end

  def show
    # shows the items in the cache, with the LRU item first
    @store.join(" | ")
  end

  private
  # helper methods go here!

end
