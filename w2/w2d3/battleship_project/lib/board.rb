require "byebug"
class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
        @n = n
    end

    def size
        @size
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, val)
        @grid[position[0]][position[1]] = val
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H 
            p "you sunk my battleship!"
            true
        else 
            self[position] = :X
            false
        end
    end

    def place_random_ships
        max = self.size * 0.25
        positions = []
        ships = 0
        while ships < max 
            position = [rand(0...@n), rand(0...@n)]
            if !positions.include?(position)
                self[position] = :S
                positions << position
                ships += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@n) {Array.new(@n)}
        @grid.each.with_index do |row, i|
            row.each_index do |j|
                if @grid[i][j] == :S
                    hidden_grid[i][j] = :N
                else
                    hidden_grid[i][j] = @grid[i][j]
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
 
    def print
        Board.print_grid(hidden_ships_grid)
    end

end

