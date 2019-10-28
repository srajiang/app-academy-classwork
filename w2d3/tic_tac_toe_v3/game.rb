require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize(n, option_hash)
        @players = []
        p @players
        option_hash.each do |mark, identity|
            if identity == false
                @players << HumanPlayer.new(mark)
            else 
                @players << ComputerPlayer.new(mark)
            end
        end
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
            position = @curr_pl.get_position(@board.legal_positions)
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

machine_civil_war = Game.new(10, h: true, u: true, e: true)
machine_civil_war.play