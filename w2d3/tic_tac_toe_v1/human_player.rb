class HumanPlayer

    def initialize(mark_value)
        @mark = mark_value     
    end

    def mark
        @mark
    end

    def get_position
        alphabet = ('a'..'z')
        p "Player #{self.mark}, enter two numbers representing a position in the format `row col`"
        input = gets.chomp.split(" ") 
        until input.length == 2 && input.none? {|ele| alphabet.include?(ele.downcase)}
            p "Sorry, you entered an invalid position. Please try again."
            input = gets.chomp.split(" ") 
        end
        input.map! {|char| char.to_i}  
    end       

end

# hooman = HumanPlayer.new(:S)
# p hooman.get_position