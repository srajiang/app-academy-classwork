require_relative './player.rb'
require_relative './dictionary.rb'

class Game
    def initialize(*players)
      @players = players.map { |player| Player.new(player) } 
      @fragment = ""

    end

    def curr
    def play_round
      
    end


end


