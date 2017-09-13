class Array
  def my_uniq
    uniq_arr = []
    self.each do |el|
      uniq_arr << el unless uniq_arr.include?(el)
    end
    uniq_arr
  end

  def two_sum
    sums = []
    idx = 0
    while idx < self.length
      idx2 = idx + 1
      while idx2 < self.length
        next if idx == idx2
        sums << [idx, idx2] if self[idx] + self[idx2] == 0
        idx2 += 1
      end
      idx += 1
    end
    sums
  end

  def my_transpose
    raise "Squares only!" if self[0].length != self[1].length
    transposed_arr = Array.new(self.length){[]}

    self.each_with_index do |arr, i|
      arr.each_with_index do |el, j|
        transposed_arr[j][i] = self[i][j]
      end
    end

    transposed_arr
  end

  def find_profit(pair)
    self[pair[1]] - self[pair[0]]
  end

  def stock_picker
    pair = []

    idx = 0
    while idx < self.length

      idx2 = idx + 1
      while idx2 < self.length

        new_pair = [idx, idx2]
        if pair == [] || self.find_profit(new_pair) > self.find_profit(pair)
          pair = new_pair if self.find_profit(new_pair) > 0
        end

        idx2 += 1
      end

      idx += 1
    end

    pair
  end

end

class TowerOfHanoi

  attr_accessor :towers

  def initialize
    @towers = Array.new(3){Array.new}
    populate_tower
  end

  def populate_tower
    @towers[0] = [3,2,1]
  end

  def move(start_pos, end_pos)
    raise 'No tower at start position!' if @towers[start_pos].empty?
    if @towers[end_pos].empty? || @towers[start_pos].last < @towers[end_pos].last
      @towers[end_pos] << @towers[start_pos].pop
    else
      raise "Invalid move!"
    end
  end

  def won?
    return true if towers[2] == [3,2,1] || towers[1] == [3,2,1]
    false
  end

end
