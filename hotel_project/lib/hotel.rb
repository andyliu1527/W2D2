require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |key, value|
            @rooms[key] = Room.new(value)
        end

    end

    def name
        split = @name.split(" ")
        split.map! {|word| word.capitalize}
        split.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(roomname)
        return true if rooms.has_key?(roomname)
        return false
    end

    def check_in(person, roomname)
        if room_exists?(roomname)
            if rooms[roomname].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?()
        rooms.any? {|key, value| !rooms[key].full?}
    end

    def list_rooms
        rooms.each do |key, value|
            puts key + " " + value.available_space.to_s
        end
    end

end
