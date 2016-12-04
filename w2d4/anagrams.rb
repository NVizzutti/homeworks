def anagram?(str1, str2)
  letters = str1.split('')
  possibilities = letters.permutation(str1.length).to_a
  possibilities.each do |word_arr|
    current = word_arr.join('')
    return true if current == str2
  end
  false
end

p anagram?('gizmo', 'sally')
p anagram?('elvis', 'lives')

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars

  arr1.count.times do
    chr = arr1.pop
    # p chr
    return false if !arr2.include?(chr)
    arr2.delete(chr)
    arr1.delete(chr)
    p arr1
    p arr2
  end
  # p "arr1 #{arr1} arr2 #{arr2}"
  arr1.empty? && arr2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort.join == str2.chars.sort.join
end


p third_anagram?('gizmo', 'sally')
p third_anagram?('elvis', 'lives')

def fourth_anagram?(str1, str2)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)
  str1.chars.each { |chr| first_hash[chr] += 1 }
  str2.chars.each { |chr| second_hash[chr] += 1 }
  first_hash == second_hash
end

def fifth_anagram?(str1, str2)
  result = Hash.new(0)
  str1.chars { |chr| result[chr] += 1 }
  str2.chars { |chr| result[chr] -= 1}
  result.values.all? { |val| val.zero? }
end


p fifth_anagram?('gizmo', 'sally')
p fifth_anagram?('elvis','lives')



# def third_anagram?(str1, str2)
#   str1.chars.sort.join == str2.chars.sort.join
# end
#
# p third_anagram?('gizmo', 'sally')
# p third_anagram?('elvis', 'lives')








def fourth_anagram?(str1, str2)
  return false if str1.length != str2.length

  hash = Hash.new(0)
  arr1 = str1.chars
  arr2 = str2.chars

  arr1.length.times do |i|
    hash[arr1[i]] += 1
    hash[arr2[i]] -= 1
  end
  # p "hash: #{hash}"
  hash.all? do |key, val|
    val == 0
  end
end

p fourth_anagram?('gizmo', 'sally')
p fourth_anagram?('elvis', 'lives')
