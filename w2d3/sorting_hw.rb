fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh',
              'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up" => 0,  "right-up" => 1, "right" => 2, "right-down" => 3,
   "down" => 4, "left-down" => 5 , "left" => 6,  "left-up" => 7 }

def quadratic_sort(arr)
  longest = arr.first
  arr[1..-1].each_with_index do |el2, j|
    el2.length > longest.length ? longest = el2 : nil
  end
  return longest
end
p quadratic_sort(fish_array)

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = arr.delete_at(rand)
  left, right = arr.partition { |el| el.length < pivot.length  }
  quick_sort(left) + [pivot] + quick_sort(right)
end

# p quick_sort(fish_array)[-1]

def merge_sort(arr)
  return arr if arr.length <= 1
  middle = arr.length / 2
  left = arr[0...middle]
  right = arr[middle..-1]
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      result << left.shift
    else
      result << right.shift
    end
  end
  result + right + left
end
# p merge_sort(fish_array)[-1]

def slow_dance(direction, arr)
  arr.each_with_index do |dir, idx|
    return idx if dir == direction
  end
  return nil
end
# p slow_dance("right-down", tiles_array

def fast_dance(direction, hash)
  hash[direction]
end

p fast_dance("right-down", tiles_hash)
