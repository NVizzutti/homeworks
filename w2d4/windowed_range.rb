# def max_windowned_range(array, size)
#   result = nil
#   array.each_index do |idx|
#     start = idx
#     finish = idx + size - 1
#     p array[start..finish]
#     break if array[finish].nil?
#     sum = array[start..finish].reduce(:+)
#     if result.nil? || sum > result
#       result = sum
#     end
#   end
#   result
# end


def max_windowned_range(arr, size)
  diff = nil
  max_window = []
  (0..(arr.length - size + 1)).each do |i|
    cur_arr = arr[i...(i + size)]
    cur_diff = cur_arr.max - cur_arr.min
    if diff.nil? || cur_diff > diff
      diff = cur_diff
      max_window = arr[i...(i + size)]
    end
  end
  max_window = max_window.minmax
  max_window[1] - max_window[0]
end

p max_windowned_range([1, 0, 2, 5, 4, 8], 2)
p max_windowned_range([1, 0, 2, 5, 4, 8], 3)
p max_windowned_range([1, 0, 2, 5, 4, 8], 4)
p max_windowned_range([1, 3, 2, 5, 4, 8], 5)

class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store[-1]
  end

end


class MyStack

  def initialize
    @store = []
    @largest = nil 
  end

  def push(el)
    @store.push(el)
    check_largest(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store[-1]
  end

  def check_largest(el)
    @largest = el if largest.nil? || el > largest

end

class StackQueue

  def initialize(store_one)
    @store_one = store_one
    @store_two = []
  end

  def dequeue(el)
    @store_one.pop
  end

  def enqueue(el)
    @store_two.push(@store_one.peek)
  end
end
