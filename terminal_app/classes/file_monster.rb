require 'json'
require 'tty-prompt'

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

        load_file()
    end


    def load_file 

        # @map.insert = "blue"

        load_prompt = TTY::Prompt.new

        user_choice = load_prompt.select('Please select one of the options', ["Start New", "Load Previous", "Reset Old"])
        case user_choice
            when "Reset Old"
                @reset = true
            when "Start New"
                @reset = true
            when "Load Previous"
                puts "okie dokie"
                @reset = false
            end


        parsed_data = JSON.load_file('../user_data.json', symbolize_names: true)


        parsed_data[0].each do |i|  # this will be for 3 elements at this stage

            case @reset
            when true 
                i[:completed] = false
            end

            @good_causes_array << Dot.new(i[:id], i[:area], i[:country], i[:category], i[:description], i[:charity_name], i[:cost].to_i, i[:completed], i[:presentation])
        end

        parsed_data[1].each do |i|
            @charity_coins_from_file = (i[:charity_coins]).to_i
            @budget_from_file = (i[:budget]).to_i 

        end
    
    end








    #         #function this code:

    #         #map.map_array => [ {k, string}    {k, string}  ]

    #         found = false
            
    #         #maybe if we remember the index we can start there

    #         temp_string = nil
    #         finding_string = true

    #         while finding_string
    #             @map.map_array[position..].each_with_index do |map_hash, index| #now will only iterate from last postion


    #                 map_hash.each do |key,value|  # have a look at the string in each line (value)

    #                     if value.include?("placeholder") && found == false # if it has the placeholder (but no previous find)

    #                         temp_string = "#{temp_string}X#{value} <<<\n"  # add the value to the temp string (LATER NEED newlines)
    #                         found = true  # first one is found, so look at the next line of the map


    #                     elsif value.include?("placeholder") && found == true #finds the next placeholder, so save position and exit loop

    #                         found = false  # reset false for the next search
    #                         position = position + index # set the new range postion
    #                         finding_string = false # not sure if need this, but it will break while loop (not sure if need THAT)

    #                         i[:presentation] = temp_string

                           
    #                         break

    #                     else 
    #                         temp_string = "#{temp_string}Y#{value}  <<<\n"      #each value is the new line

    #                     end

    #                 end
    #             end

    #         end # end while loop


    #         @good_causes_array << Dot.new(i[:id], i[:area], i[:country], i[:category], i[:description], i[:charity_name], i[:cost].to_i, i[:completed], i[:presentation])
    #     end

    #     parsed_data[1].each do |i|
    #         @charity_coins_from_file = (i[:charity_coins]).to_i
    #         @budget_from_file = (i[:budget]).to_i 

    #     end
    
    # end

    def iterate 

        @good_causes_array.each do |iteration|
            puts iteration.country
            puts iteration.completed
            # puts iteration.presentation

        end
    end


    # def save_file


    #     saved_data = [ [ ], [ ] ]

    #     @good_causes_array.each do |object|

    #         hash = {id:object.id, area:object.area, country:object.country, category:object.category, description:object.description, charity_name:object.chartity_name, cost:object.cost, completed:object.completed, presentation:object.presentation}
            
    #         saved_data[0] << hash
    #     end


    #     hash = {charity_coins: return_coins_count(), budget: return_budget_remaining()}

    #      # File.write('user_data', JSON.pretty_generate(saved_data))


    # end

 
end


# filetest = FileMonster.new

# # filetest.load_file
# filetest.iterate
