class ComputerPlayer
     def initialize(mark_value)
        @mark = mark_value     
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        p "Computer Player #{@mark}, plays #{position}"
        position
    end 
end