require 'rainbow'
require 'tty-prompt'


# https://dorkbyte.wordpress.com/2012/08/05/trick-out-your-terminal-with-ascii-art/
# https://textart.sh/topic/africa


class Map

  attr_reader :map_array, :chosen_cause, :map_menu_choices, :map_menu_selection
  attr_accessor :insert, :good_causes_array #, :file



  def initialize # replace space with underscores and interpolate the rest ?


    @prompt = TTY::Prompt.new
  
    @map_array_display = []
    @good_causes_array = []
    
    @part_of_map_picked = ""
    @chosen_cause = {}

    @map_menu_choices = ""
    @map_menu_selection = ""

    @insert = "\u2b24"
    @map_array = [
      {y48:"                    ▒▒    ▒▒░░▒▒▒▒▓▓▒▒▒▒░░"},                                                  
      {y47:"                    ██▒▒████▒▒▒▒░░▒▒▒▒░░▒▒▒▒"},                                               
      {y46:"                ██▓▓██▓▓░░▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒"},                                                 
      {y45:"                ░░░░  ░░░░▒▒░░░░░░░░░░░░░░░░░░    ░░░░▒▒  ░░"},                              
      {y44:"                ▒▒▒▒    ▒▒▓▓▓▓▒▒▒▒░░░░▒▒░░░░▒▒    ▒▒▒▒▓▓  ▒▒ "},                               
      {y43:"            ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░▒▒▓▓▒▒▓▓▓▓░░▒▒▒▒▒▒▒▒▒▒ "},                        
      {y42:"            ▒▒▓▓░░  ▒▒▒▒▓▓▒▒▒▒▒▒▒▒░░░░░░▒▒░░░░▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒"},                     
      {y41:"        ▒▒▒▒░░▒▒░░▓▓░░░░░░▓▓  ▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒░░▒▒"},                     
      {y40:"    ░░▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒  ▒▒▒▒░░▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓░░░░░░▒▒░░▒▒▒▒░░░░"},                       
      {y39:"    ▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒░░▒▒▒▒░░░░▒▒░░░░▒▒░░░░░░░░░░░░"},                     
      {y38:"    ▓▓▒▒▒▒▒▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{@insert}▒▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░"},                     
      {y37:"    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒"},                     
      {y36:"    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓"},                 
      {y35:"    ▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▓▓░░▒▒▓▓▒▒▓▓  ░░░░░░░░▒▒░░  ▓▓▓▓▒▒▒▒▓▓▒▒░░░░▒▒░░▒▒▓▓  ▒▒"},                 
      {y34:"▓▓██▓▓▓▓▒▒██▒▒░░▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒░░  ░░▒▒  ▒▒██▓▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▒▒▒▒████ "},              
      {y33:"██▒▒▒▒▒▒░░▓▓▒▒▓▓▒▒▒▒██▓▓▓▓░░▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▒▒░░▓▓▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓ "},                
      {y32:"▒▒░░▒▒▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒████▓▓  ░░▒▒▒▒░░░░░░▒▒▓▓██  ░░▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▓▓▓▓▒▒░░  "},         
      {y31:"▒▒▒▒▒▒░░▒▒██▒▒▓▓  ▒▒██▒▒▒▒▓▓▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██▒▒▓▓▒▒▓▓▒▒▓▓▒▒▓▓  ▒▒▓▓▓▓░░▒▒░░  ▒▒██▒▒ "},
      {y30:"    ▒▒▓▓░░▒▒▒▒▒▒▓▓▒▒▒▒██▓▓██▒▒░░▓▓▓▓▒▒░░░░░░▒▒▒▒▓▓▓▓▒▒▒▒▒▒#{@insert}░░▓▓▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒██▓▓ "},
      {y29:"    ██▒▒  ▒▒██▓▓▒▒▒▒██▒▒▒▒▒▒▒▒▒▒  ░░▒▒▒▒▒▒▒▒░░  ██▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓░░░░▒▒  ▓▓▒▒▒▒▒▒▒▒██▒▒▓▓ "},
      {y28:"    ▒▒▒▒▓▓██  ▒▒██▒▒▒▒▒▒▒▒▓▓▓▓▒▒░░▒▒▒▒░░░░░░▒▒▒▒░░▒▒▓▓  ▒▒▓▓░░▒▒▒▒▓▓░░▒▒▒▒▒▒▒▒  ▓▓▓▓██▒▒▒▒ "},
      {y27:"        ▒▒▓▓  ▓▓▒▒░░██▒▒░░▒▒▒▒  ▒▒▓▓░░░░▒▒▓▓▒▒▒▒▒▒▒▒░░▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓▒▒▒▒  ▓▓░░██▒▒▒▒"}, 
      {y26:"        ▒▒▒▒▒▒  ▓▓▒▒▒▒▒▒▒▒▒▒░░▒▒░░░░░░░░░░▒▒▓▓▒▒▓▓░░▓▓▓▓░░▒▒░░▒▒░░░░▒▒  ▒▒▓▓░░░░▒▒▒▒▒▒▓▓  "}, 
      {y25:"            ░░▒▒    ░░  ▒▒      ▒▒░░░░▒▒▒▒░░░░░░▒▒▒▒▓▓░░▒▒░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░░░░░░░▒▒▒▒▓▓▓▓ "},  
      {y24:"                                ░░░░▒▒▒▒▒▒▒▒▒▒░░▓▓▓▓▒▒░░▒▒▒▒▒▒▒▒░░░░░░░░▓▓▒▒░░▒▒░░▒▒▒▒  "},   
      {y23:"                                    ░░░░▒▒░░▒▒▒▒▒▒▒▒▓▓▒▒░░░░▒▒▒▒░░▒▒░░░░▒▒▓▓▒▒░░▒▒▒▒ "},      
      {y22:"                                    ░░▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒░░▒▒▓▓▒▒▒▒▒▒▒▒▒▒"},       
      {y21:"                                    ░░░░░░▒▒▒▒▒▒▒▒▓▓▒▒▒▒░░  ▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░ "},        
      {y20:"                                    ░░▒▒▒▒▒▒░░▓▓▓▓▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒  "},         
      {y19:"                                    ░░▒▒▒▒░░▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▓▓▒▒▒▒   "},          
      {y18:"                                        ░░▒▒▒▒░░▓▓▓▓██▒▒▓▓▒▒▓▓▒▒▒▒▓▓▓▓░░▓▓████▓▓ "},            
      {y17:"                                        ░░░░▒▒▒▒▓▓▒▒▓▓▓▓▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▒▒██░░░░  "},           
      {y16:"                                        ░░▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒░░░░░░░░▒▒▒▒▒▒▒▒░░▒▒  "},           
      {y15:"                                        ▒▒▓▓▒▒▓▓██▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▓▓  "},           
      {y14:"                                            ░░▒▒▒▒▒▒▓▓  ▒▒▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒   "},          
      {y13:"                                            ░░░░  ▓▓▒▒▒▒░░▒▒░░▒▒░░░░░░░░  ▓▓▒▒▒▒   "},          
      {y12:"                                        ░░▒▒▒▒▒▒░░▒▒▓▓▒▒░░▒▒▒▒░░░░░░▒▒░░▒▒  ▒▒   "},            
      {y11:"                                        ░░▒▒░░░░▒▒▒▒▒▒▒▒░░▒▒▒▒░░░░░░▒▒▓▓▒▒░░▒▒   "},            
      {y10:"                                        ░░▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒   "},              
      {y9:"                                        ░░░░░░░░░░▒▒▒▒░░▒▒▒▒▒▒░░░░░░▒▒ "},                    
      {y8:"                                        ░░▒▒░░▒▒▒▒▒▒▒▒░░░░▒▒░░▒▒▒▒░░▒▒ "},                    
      {y7:"                                            ▒▒░░▒▒░░░░▒▒░░▒▒▒▒░░░░░░▒▒▒▒"},                     
      {y6:"                                            ░░▒▒  ▒▒▒▒░░  ░░▒▒░░░░▒▒▒▒  "},                     
      {y5:"                                            ▒▒▒▒▒▒▓▓▒▒░░▒▒░░░░▒▒░░   "},                      
      {y4:"                                            ▒▒▒▒▒▒██▒▒▒▒░░▓▓▒▒▒▒░░   "},                      
      {y3:"                                            ░░░░▒▒▒▒▒▒░░░░▒▒░░░░    "},                       
      {y2:"                                                ░░▒▒▒▒░░#{@insert}░░░░▒▒     "},                          
      {y1:"                                                ▒▒  ▒▒░░▓▓2▒▒     "}
    ]                          

  end

  def update_map(good_causes_array)

    position = 0 #this is the starting position in the map array, and it will increment as each object is allocated a portion
    good_causes_array.each do |i|  # this will be for 3 elements at this stage

        found = false
        temp_string = nil
        finding_string = true

        while finding_string
            @map_array[position..].each_with_index do |map_hash, index| #now will only iterate from last postion


                map_hash.each do |key, value|  # have a look at the string in each line (value)

                    if value.include?(@insert) && found == false # if it has the placeholder (but no previous find)
                        

                        # this section extracts the circle and converts the colour

                        temp_array = value.chars()                          
                        circle_index = temp_array.index("\u2b24")

                        if i.completed == true
                            temp_array[circle_index] = Rainbow("\u2b24").green
                            value = temp_array.join("") #assigns data to the

                        elsif i.completed == false
                            temp_array[circle_index] = Rainbow("\u2b24").firebrick
                            value = temp_array.join("")

                        elsif i.completed == "possible upgrade to orange colour as well"
                            value = temp_array.join("")

                        end
                        # value = colour_my_dots(value,i)


                        temp_string = "#{temp_string}|#{value}<<<\n"  # add the value to the temp string (LATER NEED newlines)
                        found = true  # first one is found, so look at the next line of the map


   # Else if the value includes the insert BUT is the NEXT one in the list, then break and set new position in the map array to add next
                    elsif value.include?(@insert) && found == true 

                        found = false  # reset false for the next search
                        position = position + index # set the new range postion
                        finding_string = false # not sure if need this, but it will break while loop (not sure if need THAT)

                        i.presentation = temp_string

                        break

                    else 
                        temp_string = "#{temp_string}>#{value}<<<\n"      #each value is the new line

                    end

                end
            end

        end # end while loop
    end
    return good_causes_array # returns the array with strings allocated, and coloured dots updated

  end


  def update_display_array(good_causes_array)
    @map_array_display = [] # needs to be reset otherwise will accumulate the displays
    good_causes_array.each do |cause| # this will extract just the visual presentations of each cause
      @map_array_display << cause.presentation.chomp # and then put them into an array for prompt.select to work
    end
  end

  def select_cause_from_map

    prompt = TTY::Prompt.new # (active_color: :orange)

    # update_display_array()

      # available = true
      # while available
    @part_of_map_picked = prompt.select('Please select an area to view the charitable cause', @map_array_display)

  end

  def match_map_choice

    @good_causes_array.each do |cause| # iterate through objects, and see if their presentation matches the picked one
      if cause.presentation.chomp == @part_of_map_picked
        @chosen_cause = cause
        break
      end
    end
  end


  def check_if_already_completed

    if @chosen_cause.completed == true
      puts Rainbow("Thank you but you have already funded this cause. Please find another option").green
      sleep 2
      run_cause_selector()

    elsif @chosen_cause.completed == false

      puts "You have chosen an area in #{@chosen_cause.country}, #{@chosen_cause.area} Africa.
              This cause supports #{@chosen_cause.category} and you can #{@chosen_cause.description} for #{@chosen_cause.cost} Charity Coins\n\n"

        sleep 1

        @map_menu_choices = [
          "1. Support the cause for #{@chosen_cause.cost} Charity Coins",
          '2. Find another cause to support',
          '3. Return to Main Menu'
        ]

        user_choice = @prompt.select('Please select one of the options', @map_menu_choices)
        @map_menu_selection = user_choice


    end
  end


  def run_cause_selector
    select_cause_from_map()
    match_map_choice()
    check_if_already_completed()
  end




end


