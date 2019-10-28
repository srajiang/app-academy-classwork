require_relative "./board.rb"
require_relative "./human_player.rb"
class Game
    def initialize(player_1_mark, player_2_mark)
        @pl_1 = HumanPlayer.new(player_1_mark)
        @pl_2 = HumanPlayer.new(player_2_mark)
        @curr_pl = @pl_1
        @board = Board.new
    end

    def switch_turn
        @curr_pl == @pl_1 ? @curr_pl = @pl_2 : @curr_pl = @pl_1
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

game = Game.new(:X, :O) 
game.play
# p game.switch_turn 
# p game.switch_turn
# p game.switch_turn
# # => #<Game:0x0
#  @current_player=#<HumanPlayer:0x @mark=:X>,
#  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
#  @player_1=#<HumanPlayer:0x @mark=:X>,
#  @player_2=#<HumanPlayer:0x @mark=:O>>