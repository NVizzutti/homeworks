def my_min(arr)  #O(n^2)
  smallest = arr.first
  arr.each_with_index do |num, idx|
    arr[idx+1..-1].each do |num2|
      current = [num, num2].min
      smallest = current if current < smallest
    end
  end
  smallest
end

def my_min2(arr) # O(n)
  smallest = arr.first
  arr.each do |num|
    smallest = num if num < smallest
  end
  smallest
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5


def largest_contiguous_subsum(list) #O(n^3)
  biggest = nil

  list.length.times do |i|
    (i + 1..list.length).each do |j|
      cur = list[i...j]
      sum = cur.inject(:+)
      biggest = sum if biggest.nil? || sum > biggest
    end
  end
  biggest
end

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

# (1 + n) * n / 2 = n ^ 2
def largest_contiguous_subsum_2(list)
  sum = nil
  acc = nil
  if list.first > 0
    acc = list.first
  else
    acc = 0
  end
  # p "init acc: #{acc}"
  (1..list.length - 1).each do |i|
    if acc >= 0 && list[i] > 0
      acc += list[i]

    elsif acc >= 0 && list[i] < 0
      acc += list[i]
      acc = 0 if acc < 0

    elsif acc < 0 && list[i] > 0
      acc = list[i]

    end
    sum = acc if sum.nil? || acc > sum
    # p "i: #{i}"
    # p "acc: #{acc}"
  end
  sum
end

list2 = [3, -2, -5, 13, -1, -8]
p largest_contiguous_subsum_2(list2)
