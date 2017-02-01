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
    def create_new_garage(params)
        if @garage != nil 
            return puts 'A garage already exists! cannot create multiple garages.'
        end

        if !params[0]
            return puts 'Please enter a Garage size'
        end

        slotSize = params[0]
        if !slotSize.is_a? Integer and slotSize == 0
            return puts 'Garage size should be numeric'
        end

         @garage = Garage.new(slotSize)
            return puts 'Garage with ' +  slotSize + ' slots created.'
        
    end

    #reads from the prompt
    def read_prompt(*args)
        print('>',*args)
        return gets.chomp
    end

    #shows the prompt on the terminal
    def show_prompt()
        loop do
            input = read_prompt()
            command, *params = input.split /\s/
            
            #Exiting the terminal
            if command == 'exit'
                return puts 'Bye!'
            end

            process_command(command,params)
        end
    end

    #processes file based commands
    def process_file(filepath)
        puts 'reading from file hasn''t been implemented yet'
    end

    #executes a command 
    def process_command(command,params)
        case command
        when 'create_new_garage'
              self.create_new_garage(params)
        else 
            puts 'No such command!'
        end 
    end

    #initiates the application 
    def main(args)
        if args.length == 0
            show_prompt()
        elsif args.length == 1
            process_file(args[0])
        else
            puts 'Invalid Command, accepts ''ruby main.rb'' to start shell, and ''ruby main.rb *filename*'' to  process file'
        end
    end

end

#starting new terminal.
Main.new(ARGV)
