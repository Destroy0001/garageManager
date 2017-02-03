##
# fileName: Main.rb
# fileDescription: Entry point to the application 
##

require './models/Garage.rb'
require './models/Car.rb'
require './Helpers.rb'
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
        if (!is_valid_slot($slotSize))
            return puts 'ERR:Invalid Garage Size'
        end

        @garage = Garage.new($slotSize)
        return puts 'Created a parking garage with ' << ($slotSize.to_s) << ' slots.'

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
        
        return @garage.park($car)
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
        if (!is_valid_slot($slot))
            return puts 'ERR:Invalid parking slot'
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
        
        if (!defined?(@garage))
            return puts 'ERR:Garage doesn''t exist'
        end

        if (params.length < 1)
            return puts 'ERR:Enter a colour to find cars'
        end

        $colour = params[0]
        return puts @garage.registration_numbers_of_cars_with_colour($colour)

    end

    #finds the slot of a car, given car number
    def slot_for_registration_number(params)

        if (!defined?(@garage))
            return puts 'ERR:Garage doesn''t exist'
        end

        if (params.length < 1)
            return puts 'ERR:Enter a registration number to find car'
        end

        $number = params[0]
        return puts @garage.slot_for_registration_number($number)

    end

    #Finds all slots with a particular colour car
    def slots_for_cars_with_colour(params)

        if (!defined?(@garage))
            return puts 'ERR:Garage doesn''t exist'
        end

        if (params.length < 1)
            return puts 'ERR:Enter a colour to find cars'
        end

        $colour = params[0]
        return puts @garage.slots_for_cars_with_colour($colour)

    end

    #reads from the prompt
    def read_prompt(*args)

        print('> ',*args)
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


    #processes commands from a file
    def process_file(filepath)

        File.readlines(filepath).each do |line|

            if(line.chomp.length > 0 )
                command, *params = line.split(/\s/)
                if (command == 'exit')
                    return puts 'Bye!'
                end

                self.process_command(command,params)
            end

        end

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
