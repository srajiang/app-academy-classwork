require_relative "./board.rb"
require_relative "./human_player.rb"
class Game
    def initialize(n, *player_marks)
        @players = []
        player_marks.each {|mark| @players << HumanPlayer.new(mark)} 
        @curr_pl = @players[0]
        @board = Board.new(n)
    end

    def switch_turn
        @players.rotate!
        @curr_pl = @players[0]
    end
    
    def play
        while @board.any_empty?
            @board.print
            position = @curr_pl.get_position
            @board.place_mark(position, @curr_pl.mark)
            if @board.win?(@curr_pl.mark) 
                p "Player #{@curr_pl.mark} wins!"
                return
            else  
                switch_turn
            end
        end
        p 'Its a draw.'
    end

end
# p h = HumanPlayer.new(:X)

g = Game.new(4, 'A', 'B', 'C')
g.play
