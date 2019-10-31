class Card
    
    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def face_up?
        @face_up
    end

    def reveal
        @face_up = true
    end

    def hide
        @face_up = false
    end

    def to_s
        @face_value.to_s
    end

    def ==(other_card)
        self.to_s == other_card.to_s
    end
end