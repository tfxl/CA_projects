require 'tty-prompt'

require './charity_chest'
require './title'
require './introduction'
require './main_menu'
require './dot'
require './file_monster'
require './map'



class Application

    attr_reader :file

    attr_accessor :menu_selection, :good_causes_array

    def initialize

        @file = FileMonster.new
        
        @application_map = Map.new

        # @file.load_file()

        @array_display = []

        # :charity_coins_from_file, :budget_from_file

        # a Charity Chest can be created now, and will be referenced by other functions throughout program
        @user_charity_chest_APP = CharityChest.new(@file.charity_coins_from_file, @file.budget_from_file) # starting and budget parameters 
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

        @updated_good_causes = []


       

    end

    def initial_update_map_components

        @updated_good_causes = @application_map.update_map_for_objects(@file.good_causes_array)

    end

    def subsequent_update_map_components 

        @updated_good_causes = @application_map.update_map_for_objects(@updated_good_causes)

    end


    def run_setup_to_main_menu

        @title.display_title()
        @intro.display_intro

        @main_menu = MainMenu.new(@user_charity_chest_APP) # main menu now created and stored as attribute, while also requesting name
        @main_menu.display_menu 
        # display includes options. The option choice will be saved to attribute @menu_selection
        
    end

    def find_my_object() # (dot_array, dot_array_presentations)

        puts "Here we are"

        prompt = TTY::Prompt.new


        @array_display = [] # needs to be reset otherwise will accumulate the displays
        @updated_good_causes.each do |object|  # this will extract just the visual presentations of each cause
            @array_display << object.presentation # and then put them into an array for prompt.select to work
        end

        user_choice = prompt.select('Choose the place', @array_display)
    
        @updated_good_causes.each do |object| #iterate through objects, and see if their presentation matches the picked one
                if object.presentation == user_choice
                    return object # and if it does match, then return the object for further use
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

                    @user_charity_chest_APP.decrease_coins(selected_cause.cost)
                    selected_cause.completed = true

                    puts selected_cause.completed

                    subsequent_update_map_components()


                    puts "Thank you for your support. You have just supported #{selected_cause.category} in #{selected_cause.country}"
                    
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


 

    def view_map()  #view menu ?

    end




end




my_application = Application.new
my_application.initial_update_map_components()


    my_application.run_setup_to_main_menu()

while true
    my_application.menu_selection
    my_application.run_menu_selections()
end

