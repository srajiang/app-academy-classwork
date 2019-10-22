require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |k, v|  @rooms[k] = Room.new(v) }
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.keys.include?(room_name)
    end

    def check_in(person, room_name)
        return p 'sorry, room does not exist' if !self.room_exists?(room_name)
        @rooms[room_name].add_occupant(person) ? (p 'check in successful') : (p 'sorry, room is full')
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full? }
    end

    def list_rooms
        @rooms.each { |k, v| puts "#{k} : #{v.available_space}" }
    end
end
