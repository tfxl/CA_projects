require 'tty-prompt'

require './charity_chest'
require './title'
require './introduction'
require './main_menu'
require './dot'
require './file_monster'



class Application

    attr_accessor :menu_selection

    def initialize

        @file = FileMonster.new

        @file.load_file()

        @array_display = []


        # a Charity Chest can be created now, and will be referenced by other functions throughout program
        @user_charity_chest_APP = CharityChest.new(1000, 300) # starting and budget parameters 
        # This may get loaded too though!

        rede = Rainbow("\u2b24").red
        @edpg = rede

        #create a new title and introduction
        @title = Title.new
        @intro = Introduction.new

        #main_menu will be created in a function, which will request a user_name on instantiation
        @main_menu = "placeholder"

        #this attribute will hold the menu selections, which can be referenced for conditional control
        # @menu_selection = "placeholder"

        #This could be put into the Charity Chest perhaps ? It will limit the top-ups


       

    end

    def form_causes



    end



    def run_setup_to_main_menu

        @title.display_title()
        @intro.display_intro

        @main_menu = MainMenu.new(@user_charity_chest_APP) # main menu now created and stored as attribute, while also requesting name
        @main_menu.display_menu 
        # display includes options. The option choice will be saved to attribute @menu_selection
        
    end

    def find_my_object() # (dot_array, dot_array_presentations)

        prompt = TTY::Prompt.new


        @array_display = [] # needs to be reset otherwise will accumulate the displays
        @file.good_causes_array.each do |i|  # this will extract just the visual display from the causes
            @array_display << i.presentation
        end


        user_choice = prompt.select('Choose the place', @array_display)
    
        @file.good_causes_array.each do |object_display| #the area represented  the map
                if object_display.presentation == user_choice
                    return object_display
                end
            end
    end




    def run_menu_selections()

        menu_selection = @main_menu.menu_selection  #formal argument cannot be instance variable, so we'll put it here

        if menu_selection == @main_menu.menu_options[0]
            
            # now is the set of functions for map printing and selection

            selected_cause = find_my_object()

            puts "You have chosen an area in #{selected_cause.country}, #{selected_cause.area} Africa.
            This cause supports #{selected_cause.category} and you can #{selected_cause.description} for #{selected_cause.cost} Charity Coins\n\n"

            sleep 1

            prompt = TTY::Prompt.new
            choices = ["1. Support the cause for #{selected_cause.cost} Charity Coins", "2. Find another cause ?", "3. Exit"] 

            @user_charity_chest_APP.display_chest
            user_choice = prompt.select('Would you like to support this cause ?', choices)
            puts "\n"
            

            if user_choice == choices[0]
                if selected_cause.cost <= @user_charity_chest_APP.coins

                    puts "Thank you for your support. You have just supported #{selected_cause.category} in #{selected_cause.country}"
                    @user_charity_chest_APP.decrease_coins(selected_cause.cost)
                    puts "Your Charity Chest now contains:"
                    @user_charity_chest_APP.display_chest
                    puts "\n"
                    sleep 2
                    @main_menu.return_to_main

                else puts "We are sorry, you do not appear to have enough Charity Coins to support this cause
                    Please have a look at some other options"
                    @main_menu.return_to_main

                end


            elsif user_choice == choices[1]

                "No worries. Let's have a look at the other options"


            elsif user_choice == choices[2]
                exit
            end


        elsif menu_selection == @main_menu.menu_options[1]

            if @user_charity_chest_APP.budget > 0
                @user_charity_chest_APP.buy_charity_coins()
                @main_menu.return_to_main


            else @user_charity_chest_APP.budget == 0 #maybe change this to an actual value, with question? and then increase from there
                puts "Unfortunately you have no remaining budget for this month. #{Rainbow("Thank you for your previous generosity").red}"
                @main_menu.return_to_main

            end
          
            

        elsif menu_selection == @main_menu.menu_options[2]
            puts "Sorry, no groups available at this time... Perhaps complete some causes, and mabye a group will be available later"
            @main_menu.return_to_main

            # add a conditional argument to check total causes that have been comleted, and allow to continue from there.


        elsif menu_selection == @main_menu.menu_options[3]
            exit


        else 
            puts "What happened ?"
            sleep (3)
            # run menu again ?? 
        end


    end


    def form_map()

        # so will this require co-ordinates ? or just set the spacing 


    end


    def view_map()  #view menu ?

    end


   # classes instantiated in the application as all maps will have all dots and one charity chest








end

my_application = Application.new
my_application.menu_selection = my_application.run_setup_to_main_menu

while true
    my_application.menu_selection
    my_application.run_menu_selections
end

# puts my_application.menu_selection


# # puts my_application.menu_selection

# # at this point, we now have our menu displayed, and choices are available.

# x = my_application.run_menu_selections

# puts x