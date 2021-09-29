require 'json'
require 'tty-prompt'
require 'rainbow'

require './dot'
require './charity_chest'

# require './map'


class FileMonster

    attr_reader :charity_coins_from_file, :budget_from_file
    
    attr_accessor :good_causes_array

    def initialize()

        @good_causes_array = []
        @reset = "placeholder for boolean_reset ?"

        @budget_from_file = "placeholder"
        @charity_coins_from_file = "placeholder"

        # @map = Map.new

        @prompt = TTY::Prompt.new

        load_file()
    end


    def error_message_and_leave(e)

        # consider a loading bar or spinner here
        
        sleep 1
        puts "\nOk so in technical terms, this is the issue :\n\n" 

        error_msg = e.to_s.chars()
        
        error_msg.each do |i|
            print Rainbow(i).red 
            sleep 0.1
        end
        
        sleep 5
        puts Rainbow("\n\n.....Ah well.....\n").yellow
        sleep 3

        final_message = "So...... Anyways....... Well, best leave you to it !! ".chars()
        final_message.each_with_index do |character, index|
            if (index == 8) || (index == 23) || (index == final_message.length() - 1)
                sleep 4
            end
            sleep 0.1
            print Rainbow(character).yellow
        end

        exit
    end


    def parse_json_file(file_path_as_string)

        begin            
            parsed_data = JSON.load_file(file_path_as_string, symbolize_names: true)

        rescue Errno::ENOENT => e
            puts Rainbow("\n\nWell now.... file appears to be missing..... I wonder where it went ?").yellow
            file_option_chosen = true
            sleep 3
            error_message_and_leave(e)

        rescue Errno::EACCES => e
            puts Rainbow("\n\nSo you haven't got permission for this file.... Dunno why.... Guess you're not at Level 8 Clearance..").yellow
            file_option_chosen = true
            sleep 3
            error_message_and_leave(e)

        # rescue StandardError => err
        rescue => e
            puts Rainbow("\n\nAwkies.... the file is not loading.... probably a user error :) ").yellow
            file_option_chosen = true
            sleep 3
            error_message_and_leave(e)

        end
    end


    def update_financials(parsed_data)

        @charity_coins_from_file = (parsed_data[1][:charity_coins]).to_i
        @budget_from_file = (parsed_data[1][:budget]).to_i

    end

    def update_if_causes_completed(parsed_data)

        # note currently working off a single iteration for multiple data, so will need to match up with other methods if employed

    end

  


    def load_file 

        # elephant ascii ?

        file_option_chosen = false
        while !file_option_chosen

            load_options = ["Create New", "Load Last Save"]
            user_choice = @prompt.select('Please select one of the options', load_options)

            parsed_data = parse_json_file("../user_data.json")

            case user_choice

                when load_options[0]
                    @reset = true
                    
                    if parsed_data[2][:username] != "default_name_unique_string" # which is default for all new files

                        confirm = ["That's fine, start a new profile", "Actually, let me choose again"]                        
                        puts "Are you sure ? It appears there is an existing file saved under name #{parsed_data[2][:username]}"
                        confirmation = @prompt.select('Choosing New will overwrite previously saved file!', confirm)

                        case confirmation
                        when confirm[0]
                            @reset = true
                            file_option_chosen = true
                            
                        else 
                            # will loop back to first menu as while loop is still activated by file_chosen = false, @reset = false
                        end
                    
                    else 
                        @reset = true
                        file_option_chosen = true # if default username, very unlikely any user changes exist. Username quickest to confirm.
                    
                    end



                when load_options[1]

                    if parsed_data[2][:username] == "default_name_unique_string" # this is default for all new files
                        
                        puts "It appears that no previous file exists. Sorry... it just doesn't...."

                        @prompt.keypress("#{Rainbow("Please press space or enter to create New File !").orange}", keys: [:space, :return])
                        @reset = true
                        file_option_chosen = true
                        break


                    else                         
                        puts "Great to have you back #{parsed_data[2][:username]}!"
                        @reset = false

                        # optional loading box ?

                        @prompt.keypress("#{Rainbow("Please press space or enter to continue!").orange}", keys: [:space, :return])
                        file_option_chosen = true

                        print Rainbow("\nLOADING").orange
                        8.times do |i|
                            sleep 1
                            print Rainbow(".").orange
                        end
                
                    end

                else
                    puts "Appears that the file choices are out of order currently ! Soz :)"
                    sleep 5
                    exit

                end
        end


        # parsed_data = JSON.load_file('../user_data.json', symbolize_names: true)

      

        parsed_data[0].each do |i|  # this will be for 3 elements at this stage

            case @reset

            when true 
                i[:completed] = false

            when false
                if i[:completed] == "true" || true
                    i[:completed] = true

                elsif i[:completed] == "false" || false
                    i[:completed] = false

                else 
                    puts "It appears that the JSON has neither a boolean true / false or a string 'true' / 'false' "
                end
            end

            @good_causes_array << Dot.new(i[:id], i[:area], i[:country], i[:category], i[:description], i[:charity_name], i[:cost].to_i, i[:completed], i[:presentation])
        end


        update_financials(parsed_data)

    
    end


    def iterate 

        @good_causes_array.each do |iteration|
            puts iteration.country
            puts iteration.completed
            # puts iteration.presentation

        end
    end


    def save_file(updated_good_causes, charity_coins, budget_dollars, username)
        # updated_good_causes is an array of objects
        # the others are all single values

        all_da_data = [[],{},{}] #format for storage is pre-defined for convenience

        updated_good_causes.each do |object|
            all_da_data[0] << object
        end
        
        all_da_data[1][:charity_coins] = charity_coins
        all_da_data[1][:budget] = budget_dollars
        
        all_da_data[2][:username] = username
        
        File.write('user_data.json', JSON.pretty_generate(all_da_data))
    
    end


 
end


# filetest = FileMonster.new

# # filetest.load_file
# filetest.iterate
