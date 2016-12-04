class Array
  def my_uniq
    return self if self.length < 1
    out = []
    self.each do |el|
      out << el unless out.include?(el)
    end
    out

  end

  def my_transpose
    result = Array.new(self.count) { Array.new(self.count) }
    for i in 0...length
      for j in 0...length
        result[i][j] = self[j][i]
      end
    end
    result
  end

end

def stock_picker(arr)
  [0,2]

end


class Hanoi
  attr_accessor :board

  def move(pos)
    board[pos[1]] << board[pos[0]].last
    board.each do |stack|
      raise 'Illegal Move' unless stack.sort.reverse == stack
    end

  end
end
