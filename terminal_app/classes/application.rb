require 'tty-prompt'

require './charity_chest'
require './title'
require './introduction'
require './main_menu'
require './dot'



class Application

    attr_accessor :menu_selection

    def initialize


        # firstly has to create a charity_chest, unless this is made elsewhere ?

        @user_charity_chest_APP = CharityChest.new

        @edpg = "placeholder"

        # then has to load up all the causes which will carry the map info with them
        # in due course, these will need to be created and kept in appropriate lists

        @my_dot = Dot.new('West', 'Uganda', 'Cause', 'Buy a sheep', 400, "    #{Rainbow('▓▓▒▒▒▒▒').gray}▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{@edpg}▒#{Rainbow('▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░').gray}")
        @my_dot2 = Dot.new('West', 'Uganda', 'Cause', 'Buy a goat', 200, '    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒')
        @my_dot3 = Dot.new('West', 'Uganda', 'Cause', 'Buy a kangaroo', 100, '    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓')
        
        # @dot_array = [my_dot, my_dot2, my_dot3] # this could be from the ACTUAL CLASS Dot @@array_all
        # @dot_array_presentations = [my_dot.presentation, my_dot2.presentation, my_dot3.presentation] # ACTUAL CLASS Dot @@array_pres
        
        # then runs the title (shortly followed by introduction)

        @title = Title.new
        

        # then runs the introduction

        @intro = Introduction.new

        @main_menu = "placeholder"
        @menu_selection = "placeholder"
        @direct_debits = 0

       

        # then offer the first menu, which is probably going to be an object ? First menu will have display of chest and then
        # perhaps a view map and select a cause.


        # main_menu = MainMenu.new(@user_charity_chest_APP)
        # main_menu.display_menu    


            # classes instantiated in the application as all maps will have all dots and one charity chest

    end

    def run_setup_to_main_menu

        @title.display_title()
        @intro.display_intro

        @main_menu = MainMenu.new(@user_charity_chest_APP)
        @main_menu.display_menu
        
    end


    def run_menu_selections()

        menu_selection = @menu_selection  #formal argument cannot be instance variable, so we'll put it here

        if menu_selection == @main_menu.menu_options[0]
            puts "You chose the first option"

            # now is the set of functions for map printing and selection






        elsif menu_selection == @main_menu.menu_options[1]
            puts "How much would you like to spend ?" #

            @direct_debits += 1
            if @direct_debits > 3 #maybe change this to an actual value, with question? and then increase from there
                puts "unfortunately you have no remaining balance on card"
            else
                puts "You just spent $10 and gained another 100 Charity Coins"
                # @user_charity_chest_APP.increase_coins(100)
                @user_charity_chest_APP.increase_coins(100)
                @user_charity_chest_APP.display_chest
            end
            


        elsif menu_selection == @main_menu.menu_options[2]
            puts "Sorry, no groups available at this time... Perhaps complete some causes, and a groupe will be available later"

            # add a conditional argument to check total causes that have been comleted, and allow to continue from there.


        else 
            puts "What happened ?"
            sleep (3)
            # run menu again ?? 
        end



    end



    def form_structures

        #read in file, and then iterate and create the objects. 

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

puts my_application.menu_selection


# puts my_application.menu_selection

# at this point, we now have our menu displayed, and choices are available.

x = my_application.run_menu_selections

puts x