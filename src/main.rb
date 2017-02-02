##
# fileName: main.rb
# fileDescription: entry point to the application 
##

require './models/Garage.rb'
require './models/Car.rb'
class Main

    #constructor for main
    def initialize(args)

        self.main(args)

    end

    #creating new garage
    def create_parking_garage(params)

        if (defined?(@garage))
            return puts 'ERR:A garage already exists! cannot create multiple garages.'
        end

        if (!params[0])
            return puts 'ERR:Please enter a Garage size'
        end

        $slotSize = params[0]
        if (!($slotSize.is_a? Integer) && ($slotSize.to_i < 1))
            return puts 'ERR:Garage size should be numeric'
        end

        @garage = Garage.new($slotSize)
        return puts 'Created a parking garage with' << ($slotSize.to_s) << ' slots.'

    end

    #park cars
    def park(params)
        
        if (!defined?(@garage))
            return puts 'ERR:Garage doesn''t exist'
        end

        if (params.length < 2)
            return puts 'ERR:Invalid car information.'
        end

        $car  = Car.new
        $car.number = params[0]
        $car.colour = params[1]

        $slot = @garage.park($car)
        $slot += 1

        if($slot == 0)
            return puts 'Sorry, parking garage is full.'
        end

        puts 'Park in slot number:' << $slot.to_s << '.'

    end

    #leave parking slot
    def leave(params)

        if (!defined?(@garage))
            return puts 'ERR:Garage doesn''t exist'
        end

        if (params.length < 1)
            return puts 'ERR:Enter a slot to leave'
        end

        $slot = params[0]
        if (!($slot.is_a? Integer) && ($slot.to_i < 1))
            return puts 'ERR:Parking slot is numeric'
        end

        return puts @garage.leave($slot)

    end

    #show the status of the garage
    def status(params)

        if (!defined?(@garage))
            return puts 'ERR:Garage doesn''t exist'
        end

        return @garage.status()
    end

    #finds registration number of cars with particular colour
    def registration_numbers_of_cars_with_colour(params)

        return puts 'To be implemented'

    end

    #finds the slot of a car, given car number
    def slot_for_registration_number

        return puts 'To be implemented'

    end

    #Finds all slots with a particular colour car
    def slots_for_cars_with_colour

        return puts 'To be implemented'

    end

    #reads from the prompt
    def read_prompt(*args)

        print('>',*args)
        return gets.chomp

    end

    #shows the prompt on the terminal
    def show_prompt()

        loop do

            input = self.read_prompt()
            command, *params = input.split(/\s/)
            
            #Exiting the terminal
            if (command == 'exit')
                return puts 'Bye!'
            end

            self.process_command(command,params)

        end

    end

    #processes file based commands
    def process_file(filepath)

        puts 'reading from file hasn''t been implemented yet'
    
    end




    #executes a command 
    def process_command(command,params)

        case command
        when 'create_parking_garage'
            self.create_parking_garage(params)
        when 'park'
            self.park(params)
        when 'leave'
            self.leave(params)
        when 'status'
            self.status(params)
        when 'registration_numbers_of_cars_with_colour'
            self.registration_numbers_of_cars_with_colour(params)
        when 'slots_for_cars_with_colour'
            self.slots_for_cars_with_colour(params)
        when 'slot_for_registration_number'
            self.slot_for_registration_number(params)
        else
            puts 'ERR:No such command!'
        end

    end

    #initiates the application 
    def main(args)

        if (args.length == 0)
            self.show_prompt()
        elsif (args.length == 1)
            self.process_file(args[0])
        else
            puts 'ERR:Invalid Command, accepts ''ruby main.rb'' to start shell, and ''ruby main.rb *filename*'' to  process file'
        end

    end

end

#starting new terminal.
Main.new(ARGV)
