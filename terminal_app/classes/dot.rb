require 'rainbow'


class Dot

    attr_reader :area, :country, :cause_name, :description, :id, :completed

    attr_accessor :cost, :completed, :progress, :percentage

    @@id = 0
    @@dot_list = []

    def initialize(area, country, cause_name, description, cost);

        @area = area
        @country = country
        @cause_name = cause_name
        @cost = cost
        @description = description
        @id = @@id
        @@id += 1
        @completed = false
        @progress = [1,2,3]
        # @progress_string = "#{puts @progress} #{@length.progress * 10}% completed"
        @percentage = 0

        @presentation = "o" # this should be an iteration of the map sections. So... design the map and areas first,
        # then allocate the relevant string (1 or 2 or 3 lines) to the cause. Then, if ranbow applied, it will not appear
        # like the whole section is being picked, just the cause area. 
        

        # @presentation = [Rainbow("o").red, Rainbow("o").orange, Rainbow("o").green]   # options for new images ?

        @@dot_list << self # not sure if this will prove useful, but it might for iteration and displays
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

end