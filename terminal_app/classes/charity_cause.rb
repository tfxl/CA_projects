require 'rainbow'
# require './classes/map'


class CharityCause

    attr_reader :id, :area, :country, :category, :description, :charity_name, :cost
    attr_accessor :completed, :presentation


    def initialize(id, area, country, category, description, charity_name, cost, completed, presentation)

        @id = id
        @area = area
        @country = country
        @category = category
        @description = description
        @charity_name = charity_name
        @cost = cost
        @completed = completed
        @presentation = ""

    end


    # Returns {}
    def to_json_format
        return {
            id: @id,
            area: @area,
            country: @country,
            category: @category,
            description: @description,
            charity_name: @charity_name,
            cost: @cost,
            completed: @completed,
            presentation: @presentation,
        }
    end


    def advise_cause
        puts "This village in #{@country} is in need. You can #{@description} for {@cost} charity coins"
        puts "Would you like to, 
        1. Purchase this for #{country} ?
        2. Search elsewhere ?" 
    end



    def selected
        if self.completed true
            puts "This village had DESCRIPTION"
            puts "You have already donated to this cause and it is 100% funded"
            puts "Please select from the following options"
            puts "1. Review remaining charity coins, 2. select another cause, 3. return to main menu"
        else 
            puts "This village has DESCRIPTION. You could sponsor this for COST"
            puts "Would you like to sponsor this"
            puts "Future partial sponsorship avaiable"
        end

    end

end