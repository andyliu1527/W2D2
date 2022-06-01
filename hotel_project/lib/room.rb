class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        return false if occupants.length < capacity
        return true
    end

    def available_space
        return capacity - occupants.length
    end

    def add_occupant(person)
        if !full?
            occupants << person
            return true
        else
            return false
        end
    end
    
end