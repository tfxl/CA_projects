require 'rainbow'
require 'tty-prompt'
# require './file_monster'

# https://dorkbyte.wordpress.com/2012/08/05/trick-out-your-terminal-with-ascii-art/
# think about lolize and gradient coloring

#https://textart.sh/topic/africa


# THINK ABOUT DIVIDING INTO AREA, THEN CYCLE THROUGH THE AREAS IN OPTIONS



class Map

    attr_reader :map_array

    attr_accessor :insert#, :file


    def initialize # replace space with underscores and interpolate the rest ?

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
            {y39:"    ▒▒▓▓░░▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒1▒░░▒▒░░▒▒▒▒░░░░▒▒░░░░▒▒░░░░░░░░░░░░"},                     
            {y38:"    ▓▓▒▒▒▒▒▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{@insert}▒▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░"},                     
            {y37:"    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒2░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒"},                     
            {y36:"    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓"},                 
            {y35:"    ▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▓▓░░▒▒▓▓▒▒▓▓  ░░░░░░░░▒▒░░  ▓▓▓▓▒▒▒▒▓▓▒▒░░░░▒▒░░▒▒▓▓  ▒▒"},                 
            {y34:"▓▓██▓▓▓▓▒▒██▒▒░░▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒░░  ░░▒▒  ▒▒██▓▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▓▓▒▒▒▒████ "},              
            {y33:"██▒▒▒▒▒▒░░▓▓▒▒▓▓▒▒▒▒██▓▓▓▓░░▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▒▒░░▓▓▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓ "},                
            {y32:"▒▒░░▒▒▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒████▓▓  ░░▒▒▒▒░░░░░░▒▒▓▓██  ░░▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▓▓▓▓▒▒░░  "},         
            {y31:"▒▒▒▒▒▒░░▒▒██▒▒▓▓  ▒▒██▒▒▒▒▓▓▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██▒▒▓▓1▒▒▓▓▒▒▓▓▒▒▓▓  ▒▒▓▓▓▓░░▒▒░░  ▒▒██▒▒ "},
            {y30:"    ▒▒▓▓░░▒▒▒▒▒▒▓▓▒▒▒▒██▓▓██▒▒░░▓▓▓▓▒▒░░░░░░▒▒▒▒▓▓▓▓▒▒▒▒▒▒#{@insert}░░▓▓▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒██▓▓ "},
            {y29:"    ██▒▒  ▒▒██▓▓▒▒▒▒██▒▒▒▒▒▒▒▒▒▒  ░░▒▒▒▒▒▒▒▒░░  ██▓▓▒▒▒▒▒▒▒▒2▒▒▓▓▓▓░░░░▒▒  ▓▓▒▒▒▒▒▒▒▒██▒▒▓▓ "},
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
            {y3:"                                            ░░░░▒▒▒▒▒▒░░░░1▒▒░░░░    "},                       
            {y2:"                                                ░░▒▒▒▒░░#{@insert}░░░░▒▒     "},                          
            {y1:"                                                ▒▒  ▒▒░░▓▓2▒▒     "}]                          

    end

    # def draw_map()
    #     x = 0
    #     puts "\n\n\n"
    #     @map_array.each do |i|
    #         i.each do |key, value|
    #             puts value
    #         end
    #     end
    #     puts "\n\n"

    # end

    # def colour_my_dots(value, i)

    #     temp_array = value.chars()
    #     circle_index = temp_array.index("\u2b24")

    #     puts i.completed

    #     if i.completed == true
    #         temp_array[circle_index] = Rainbow("\u2b24 ").green
    #         value = temp_array.join("")
    #         return value
    #     elsif i.completed == false
    #         temp_array[circle_index] = Rainbow("\u2b24 ").darkblue
    #         value = temp_array.join("")
    #         return value
    #     elsif i.completed == "possible upgrade to orange colour as well"
    #         value = temp_array.join("")

    #     end
    # end





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
                                temp_array[circle_index] = Rainbow("\u2b24 ").green
                                value = temp_array.join("")
                            elsif i.completed == false
                                temp_array[circle_index] = Rainbow("\u2b24 ").firebrick
                                value = temp_array.join("")
                            elsif i.completed == "possible upgrade to orange colour as well"
                                value = temp_array.join("")

                            end
                            # value = colour_my_dots(value,i)


                            temp_string = "#{temp_string}X#{value} <<<\n"  # add the value to the temp string (LATER NEED newlines)
                            found = true  # first one is found, so look at the next line of the map




    # Else if the value includes the insert BUT is the NEXT one in the list, then break and set new position in the map array to add next
                        elsif value.include?(@insert) && found == true 

                            found = false  # reset false for the next search
                            position = position + index # set the new range postion
                            finding_string = false # not sure if need this, but it will break while loop (not sure if need THAT)

                            i.presentation = temp_string
 
                            break

                        else 
                            temp_string = "#{temp_string}Y#{value}  <<<\n"      #each value is the new line

                        end

                    end
                end

            end # end while loop
        end
        return good_causes_array
    end
end


# bob = Map.new
# # # x = bob.create_map()
# # # bob.draw_map(x)

# bob.update_map_for_objects(bob.file.good_causes_array)

# bob.file.good_causes_array.each do |i|
#     puts i
#     puts "space"
#     puts i.presentation
#     puts i.completed
# end
