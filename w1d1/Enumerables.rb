class Array
  def my_each
    idx = 0
    while idx <= self.length - 1
      yield(self[idx])
      idx += 1
    end

  end

  def my_select
    result = []
    for idx in 0...self.length
      result << self[idx] if yield(self[idx]) == true
    end
    return result
  end

  def my_reject
    result = []
    for idx in 0...self.length
      result << self[idx] if yield(self[idx]) == false
    end
    return result
  end

  def my_any
    for idx in 0...self.length
      return true if yield(self[idx])
    end
    return false
  end

  def my_flatten
    result = []
    self.my_each do |array|
      if !array.is_a?(Array)
        result << array
        next
      else
         result.concat(array.my_flatten)
      end
    end
    return result
  end

  def my_zip(*args)
    idx = 0
    result = []
    while idx < self.length
      current = []
      current << self[idx]
      args.each {|arg| current << arg[idx]}
      result << current
      idx += 1
    end
    result
  end

  def my_rotate(num = 1)
    repeat = num.abs
    repeat.times do
      self.push(self.shift) if num > 0
      self.unshift(self.pop) if num < 0
    end
    return self
  end

  def my_join(chr='')
    answer = ''
    self.my_each do |el|
      answer += el
      answer += chr
    end
    answer[0..-2]
  end

  def my_reverse
    result = []
    (self.length-1).downto(0) do |idx|
      result << self[idx]
    end
    return result
  end

  def factors(num)
    self.my_select {|el| el % num == 0}
  end

  def bubble_sort!(&prc)
    if !block_given?
      prc = Proc.new{ |a,b| a <=> b  }
    end

    sorted = false
    until sorted
      sorted = true
      for idx in 0...self.length - 1
        if prc.call(self[idx], self[idx+1]) == 1
          self[idx], self[idx+1] = self[idx+1], self[idx]
          sorted = false
        end
      end
    end
    return self
  end

  def bubble_sort
    self.dup.bubble_sort!
  end

end


def substrings(str)
  answer = []
  outer_loop = 0
  while outer_loop < str.length
    inner_loop = outer_loop + 1
    answer << str[outer_loop]
    while inner_loop < str.length
      answer << str[outer_loop..inner_loop]
      inner_loop += 1
    end
    outer_loop += 1
  end
  answer
end

# print substrings("cat") #=> c ca cat a at t

def subwords(word, dictionary)
  dictionary.select{ |substr|
    word.match(substr)
  }
end

# p subwords("asdfctqwer", ["cat", "car"])
