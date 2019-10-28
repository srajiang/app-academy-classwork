class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_')}    end
    
    def [](position)
        @grid[position[0]][position[1]]
    end

    def valid?(position)
        range = (0...@grid.length)
        range.include?(position[0]) && range.include?(position[1])
    end

    def empty?(position)
        self[position] == '_'
    end

    def any_empty?
        @grid.each.with_index do |row, i|
            row.each_index do |j|
                return true if self.empty?([i, j])
            end
        end
        false
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "Position either not valid or not empty"
        end
    end

    def print
        @grid.each {|row| puts row.join(" ")}
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|ele| ele == mark} }
    end

    def win_col?(mark)
        @grid.transpose.any? {|row| row.all? {|ele| ele == mark} }
    end

    def win_diagonal?(mark)
        range = (0...@grid.length)
        diag_1 = true
        diag_2 = true
        range.each do |i|
            diag_1 = false if self[[i , i]] != mark
            diag_2 = false if self[[i, -1 - i]] != mark
        end
        diag_1 || diag_2
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    
end

# diag
# p b = Board.new
# p b.any_empty?

# #  b.place_mark([0,2], :X)
# #  b.place_mark([1,1], :X)
# #  b.place_mark([2,0], :X)
# p b.any_empty?

#row
# p b = Board.new
#  b.place_mark([0,0], :X)
#  b.place_mark([0,1], :X)
#  b.place_mark([0,2], :X)
# b.print
# p b.win?(:X)

# #col
# p b = Board.new
#  b.place_mark([0,0], :X)
#  b.place_mark([1,1], :X)
#  b.place_mark([2,0], :X)
# b.print
# p b.win?(:X)

