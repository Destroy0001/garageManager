# fileName: Garage.rb
# fileDescription: Model class for Garage. 

require './models/Car.rb'
class Garage
    
    #Constructor, create a garage of provided number of empty slots. 
    def initialize(slots)
        @slots = Array.new(slots.to_i) { |i| }
    end

    #parks a car in the closest possible slot
    def park(car)
        @slots.each_with_index do |slot, index|
            if (slot.nil?)
                    @slots[index] = car
                    return index
            end
        end
        
        return -1
    end

    #empties a slot
    def leave(slot)

        slot = slot.to_i
        slot -= 1
        if (slot > @slots.length)
            return 'ERR:Invalid Slot!'
        end

        @slots[slot] = nil
        slot += 1

        puts 'Slot number' << slot.to_s << ' is free.'

    end

    #Shows status of the garage
    def status()

        puts    'Slots	Registration	Colour'
        @slots.each_with_index do |car, index|

            $slot = index + 1
            if (car.nil?)
                puts $slot.to_s << '	EMPTY SLOT'
            else 
                puts $slot.to_s << '	' << car.number << '	' << car.colour
            end

            puts ''
        end

    end

end

