def two_sum?(arr, target)#sorting
  arr1 = arr.sort
  arr1.each_with_index do |el1, idx|
    # arr2 = arr1.delete(el1)
    arr1[idx+1..-1].each do |el2|
      return true if target == el1.to_i + el2.to_i
    end
  end
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  middle = arr.length / 2

  if target < arr[middle]
    return bsearch(arr[0...middle], target)
  elsif arr[middle] == target
    return middle
  elsif target > arr[middle]
    subsearch = bsearch(arr[middle+1..-1], target)
    subsearch.nil? ? nil : subsearch + (middle + 1)
  end
end

tst_arr = (0..40).to_a
bsearch(tst_arr, 22)

# arr = [0, 1, 5, 7]
# arr_two = [7, 2, 5, 3, 1]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr_two, 12) # => should be false


def two_sum_hash?(arr, target)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end

  arr.each do |el|
    # p "el: #{el}"
    cur_hash = hash.dup
    # p "cur_hash : #{cur_hash}"
    cur_hash[el] -= 1
    return true if cur_hash[target - el] != 0
  end
  false
end

arr = [0, 1, 5, 7]

p two_sum_hash?(arr, 9) # => should be false
