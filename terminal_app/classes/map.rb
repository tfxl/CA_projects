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
    @temp_good_causes_array = []
    
    @part_of_map_picked = ""
    @chosen_cause = {}

    @map_menu_choices = ""
    @map_menu_selection = ""

    @position = 0 #this is the starting position in the map array, and it will increment as each object is allocated a portion
    @break = false


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
      {y11:"                                        ░░▒▒░░░░▒▒▒▒▒▒▒▒░░#{@insert}▒▒▒▒░░░░░░▒▒▓▓▒▒░░▒▒   "},            
      {y10:"                                        ░░▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒   "},              
      {y9:"                                        ░░░░░░░░░░▒▒▒▒░░▒▒▒▒▒▒░░░░░░▒▒ "},                    
      {y8:"                                        ░░▒▒░░▒▒▒▒▒▒▒▒░░░░▒▒░░▒▒▒▒░░▒▒ "},                    
      {y7:"                                            ▒▒░░▒▒░░░░▒▒░░▒▒▒▒░░░░░░▒▒▒▒"},                     
      {y6:"                                            ░░▒▒  ▒▒▒▒░░  ░░▒▒░░░░▒▒▒▒  "},                     
      {y5:"                                            ▒▒▒▒▒▒▓▓▒▒░░▒▒░░░░▒▒░░   "},                      
      {y4:"                                            ▒▒▒▒▒▒██▒#{@insert}▒▒▒░░▓▓▒▒▒▒░░   "},                      
      {y3:"                                            ░░░░▒▒▒▒▒▒░░░░▒▒░░░░    "},                       
      {y2:"                                                ░░▒▒▒▒░░░░░1░▒▒     "},                          
      {y1:"                                                ▒▒  ▒▒░░▓▓2▒▒     "}
    ]                          

  end


  def colour_the_dots(value, i)

    temp_array = value.chars()                          
    circle_index = temp_array.index("\u2b24")

    if i.completed == true
        temp_array[circle_index] = Rainbow("\u2b24").green
        value = temp_array.join("") #assigns data to the
        return value

    elsif i.completed == false
        temp_array[circle_index] = Rainbow("\u2b24").firebrick
        value = temp_array.join("")
        return value

    elsif i.completed == "possible upgrade to orange colour as well"
        value = temp_array.join("")
        return value

    end
  end


  def update_map(good_causes_array)

    # @position = 0 #this is the starting position in the map array, and it will increment as each object is allocated a portion
    good_causes_array.each do |i|  # this will be for 3 elements at this stage
      
      new_position = @position
      temp_string = nil
      @break = false

      @map_array[new_position..].each_with_index do |map_hash, index| #now will only iterate from last postion

        if @break == true
          break
        end

        map_hash.each do |key, value|  # have a look at the string in each line (value)

          if value.include?(@insert)
            @position = @position + index + 1

            value = colour_the_dots(value, i) # red for not completed, green for completed
            temp_string = "#{temp_string}|#{value}<<<\n"  # add the value to the temp string
            i.presentation = temp_string

            @break = true

          else 
              temp_string = "#{temp_string}>#{value}<<<\n"      #each value is the new line

          end
        end
      end
    end #end iteration of good causes
    return good_causes_array #returns array with updated presentation values, including coloured dots
  end 


  def update_display_array(good_causes_array)
    @map_array_display = [] # needs to be reset otherwise will accumulate the displays
    good_causes_array.each do |cause| # this will extract just the visual presentations of each cause
      @map_array_display << cause.presentation.chomp # and then put them into an array for prompt.select to work
    end
  end

  def select_cause_from_map
    @part_of_map_picked = @prompt.select('Please select an area to view the charitable cause', @map_array_display)
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

