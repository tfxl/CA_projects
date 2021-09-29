require 'json'
require 'tty-prompt'

require './dot'
require './charity_chest'


class FileMonster

    attr_reader :charity_coins_from_file, :budget_from_file, :good_causes_array

    def initialize()

        @good_causes_array = []
        @reset = "placeholder for boolean_reset ?"

        @budget_from_file = "placeholder"
        @charity_coins_from_file = "placeholder"
    end


    def load_file 

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

        parsed_data[0].each do |i|
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

    def iterate 

        @good_causes_array.each do |iteration|
            puts iteration.country
            puts iteration.completed

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

# filetest.load_file
# filetest.iterate
