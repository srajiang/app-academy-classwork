class Flight
    def initialize (flight_number,capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full? 
        #0 == @capacity - self.passengers.length
        @capacity == self.passengers.length
    end

    def board_passenger(passenger)
        if !self.full?
            passenger.has_flight?(@flight_number) ? self.passengers << passenger : passenger
        end
    end

    def list_passengers
        @passengers.map {|passenger| passenger.name }
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end