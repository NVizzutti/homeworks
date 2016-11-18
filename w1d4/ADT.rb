class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @line = []
  end

  def enqueue(el)
    @line << el
  end

  def dequeue
    @line.shift
  end

  def show
    print @line
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    matches = @map.find { |pair| pair[0] == key }
    idx = @map.index(matches) if matches
    @map[idx][1] = value if matches
    @map << [key, value] unless matches
  end

  def lookup(key)
    matches = @map.find { |pair| pair[0] == key }
  end

  def show
    p @map
  end

  def remove(key)
    matches = @map.find { |pair| pair[0] == key }
    @map.delete_at(@map.index(matches)) if matches
  end

end
