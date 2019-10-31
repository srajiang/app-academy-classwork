class Player

    attr_reader :name

    def initalize(name)
        @name = name
    end

    def guess
        p 'Please enter a guess:'
        input = gets.chomp
    end

    def alert_invalid_guess
        p 'That was an invalid guess.'
    end

end