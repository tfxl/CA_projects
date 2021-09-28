require 'rainbow'
# require './classes/map'


class Dot

    attr_reader :area, :country, :cause_name, :description, :id, :completed, :presentation

    attr_accessor :cost, :completed, :progress, :percentage

    @@id = 0
    @@dot_array = []
    @@dot_array_presentations = []

    # SO, ALL VALUES ARE PREDEFINED ANYWAYS !!!! So import them as a list, with default data, and then update accordingly.

    def initialize(id, area, country, category, description, charity_name, cost, completed, presentation)   #, use imported data values

        @area = area
        @country = country
        @category = category
        @cost = cost
        @description = description

        @id = id
        @@id += 1
        

        @red_colour = Rainbow("\u2b24").firebrick
        @orange_colour = Rainbow("\u2b24").orange
        @green_colour = Rainbow("\u2b24").green

        @current_dot = @red_colour

        # ▓▒▒▒▒▒▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{@current_dot}▒▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░




        @completed = completed



        # if @@id = 0
        # if line does not contain a dot, add until find one that does, THEN
        # selected_line = starting at next position, if line contains a DOT, then allocate, and THEN
        # if next line does not contain a dot then allocate


        # if @@1d > 0 then only do the bottom 2 lines. 

        @progress = [1,2,3]
        # @progress_string = "#{puts @progress} #{@length.progress * 10}% completed"
        @percentage = 0


        @presentation = presentation
        # @presentation = [{test: "hi"}, "blue"] # this should be an iteration of the map sections. So... design the map and areas first,
        # then allocate the relevant string (1 or 2 or 3 lines) to the cause. Then, if ranbow applied, it will not appear
        # like the whole section is being picked, just the cause area. 
        

        # @presentation = [Rainbow("o").red, Rainbow("o").orange, Rainbow("o").green]   # options for new images ?

        @@dot_array << self # not sure if this will prove useful, but it might for iteration and displays
        @@dot_array_presentations << self.presentation
    end





    def progress_bar()
        @progress.each do |i|
            puts "____________________"
            puts "|___________________| #{@percentage}% completed"

        end
    end

    def advise_cause
        puts "This village in #{@country} is in need. You can #{@description} for {@cost} charity coins"
        puts "Would you like to, 
        1. Purchase this for #{country} ?
        2. Search elsewhere ?" 
    end

    def full_donation
        @percentage = 100   # this will be useful for red / orange / green colours
        @completed = true
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