class HumanPlayer

    def initialize(mark_value)
        @mark = mark_value     
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        alphabet = ('a'..'z')
        p "Player #{self.mark}, enter two numbers representing a position in the format `row col`"
        input = gets.chomp.split(" ").map! {|char| char.to_i }
        until input.length == 2 && input.none? {|ele| alphabet.include?(ele.to_s.downcase)} && legal_positions.include?(input)
            p "Sorry, you entered an invalid position. Please try again."
            input = gets.chomp.split(" ").map! {|char| char.to_i }
        end
        input
    end       

end


# sarah = HumanPlayer.new(:X)
# positions = [[1, 2], [3, 4], [4, 3]]
# p sarah.get_position(positions)