require_relative "card.rb"

class Board

    def initialize(length)
        if length.even?
            @board = Array.new(length) { Array.new(length, nil)}
            @size = length * length
            @all_vals, @all_pos = Set.new, Set.new
        else
            raise "Invalid length given, please enter an even number"
        end
    end

    def populate
        num_pairs = @size / 2
        until grid_full?
            face_val = make_face_value
            card_1 = Card.new(face_val)
            card_2 = Card.new(face_val)
            pair = [card_1, card_2]
            pair.each do |card|
                position = generate_position
                self[position] = card
            end
        end
        true
    end

    def render
        (0...@board.length).each do |idx| 
            if idx == 0
                print "  " + idx.to_s
            elsif idx < @board.length - 1
                print " " + idx.to_s 
            else
                print " " + idx.to_s + "\n"
            end
        end
        @board.each.with_index do |row, idx|

            curr_row = row.map do |card|  
                if card.face_up?
                    card.to_s
                else
                    " "
                end 
            end
            puts ([idx] + curr_row).join(' ')
        end
    end

    def won?
        @board.all? do |row|
            row.all? do |card|
                card.face_up?
            end
        end
    end

    def reveal(guessed_pos)
        card = self[guessed_pos]
        if !card.face_up?
            card.reveal
            card
        end
    end

    #Helper Methods

    def generate_position
        position = [rand(0...@board.length), rand(0...@board.length)]
        while @all_pos.include?(position)
            position = [rand(0...@board.length), rand(0...@board.length)]
        end
        @all_pos << position
        position
    end

    def make_face_value
        value = rand(33..126).chr
        while @all_vals.include?(value)
            value = rand(33..126).chr
        end
        @all_vals << value 
        value
    end

    def grid_full?
        @board.each_index do |idx_1|
            @board.each_index do |idx_2|
                position = [idx_1, idx_2]
                return false if self[position] == nil 
            end
        end
        true
    end

    def [](position)
        row, col = position
        @board[row][col]
    end

    def []=(position, val)
        row, col = position
        @board[row][col] = val
    end

    #Temp Helper Method
    def cheat
        @board.each do |row|
            puts row.map {|card| card.to_s }.join(' ')
        end
    end

end