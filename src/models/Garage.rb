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

        #checking if the car number already exists or not
        if(self.slot_for_registration_number(car.number ) != 'Not found.')
            return puts 'ERR:Car with this registration number is already parked!'
        end

        #if it doesn't exit, park in the first slot available
        @slots.each_with_index do |slot, index|
            if (slot.nil?)
                    @slots[index] = car
                    return puts 'Park in slot number:' << (index+1).to_s << '.'
            end
        end
        
        return puts 'Sorry, parking garage is full'

    end

    #empties a slot
    def leave(slot)

        slot = slot.to_i
        slot = slot - 1

        #slot has to be with the slot numbers
        if (slot >= @slots.length)
            return 'ERR:Invalid parking slot!'
        end

        #free the slot
        @slots[slot] = nil
        slot += 1

        puts 'Slot number ' << slot.to_s << ' is free.'

    end

    #Shows status of the garage
    def status()

        puts    'Slots	Registration	Colour'
        @slots.each_with_index do |car, index|

            $slot = index + 1

            #if slot is free show empty slot, else show details
            if (car.nil?)
                puts $slot.to_s << '	EMPTY SLOT'
            else 
                puts $slot.to_s << '	' << car.number << '	' << car.colour
            end

            puts ''
        end

    end


    #find registration numbers of all cars with particular colour
    def registration_numbers_of_cars_with_colour(colour)
        
        $numbers = []

        #look for the number and make a lost
        @slots.each_with_index do |car,index |
            if(!car.nil? && car.colour == colour)
                $numbers.push(car.number)
            end
        end

        if($numbers.length > 0)
            return  $numbers.join(',')
        end

        return 'Not found.'

    end

    #Finds all slots with a particular colour car
    def slots_for_cars_with_colour(colour)

        $slots = []
        @slots.each_with_index do |car,index |
            if(!car.nil? && car.colour == colour)
                $slots.push(index+1)
            end
        end

        if($slots.length > 0)
            return puts $slots.join(',')
        end

            return 'Not found.' 
    end

    #finds the slot of a car, given car number
    def slot_for_registration_number(number)

        @slots.each_with_index do |car,index|
            if (!car.nil? && car.number == number)
                return puts index+1
            end
        end

        return 'Not found.'
    end

end

