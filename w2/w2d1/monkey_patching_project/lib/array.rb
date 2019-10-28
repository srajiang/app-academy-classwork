# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / (self.length * 1.0)
  end   

  def median
    return nil if self.empty?
    sorted = self.sort
    if sorted.length.odd?
        sorted[(sorted.length - 1) / 2]
    else
        sum = sorted[(sorted.length / 2) - 1] + sorted[sorted.length / 2]
        sum.to_f / 2
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash
  end

  def my_count(val)
    count = 0 
    self.each {|ele| count += 1 if ele == val}
    count
  end

  def my_index(val)
    self.each.with_index{|ele, i| return i if ele == val}
    nil
  end

  def my_uniq
    new_arr = []
    self.each{|ele| new_arr << ele if !new_arr.include?(ele)}
    new_arr
  end

  def my_transpose
    rows = self.length
    cols = self[0].length
    transposed = Array.new(cols) {Array.new([])}

    (0...rows).each do |row| 
        (0...cols).each do |col|
            transposed[col] << self[row][col]
        end
    end  
    transposed
  end
end


