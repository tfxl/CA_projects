require_relative 'charity_chest.rb'
require_relative 'title'
require 'tty-prompt'



class Application

    # firstly has to create a charity_chest, unless this is made elsewhere ?

    @user_charity_chest_APP = CharityChest.new

    # then has to load up all the causes which will carry the map info with them
    # in due course, these will need to be created and kept in appropriate lists

    @my_dot = Dot.new('West', 'Uganda', 'Cause', 'Buy a sheep', 400, "    #{Rainbow('▓▓▒▒▒▒▒').gray}▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{edpg}▒#{Rainbow('▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░').gray}")
    @my_dot2 = Dot.new('West', 'Uganda', 'Cause', 'Buy a goat', 200, '    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒')
    @my_dot3 = Dot.new('West', 'Uganda', 'Cause', 'Buy a kangaroo', 100, '    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓')
    
    @dot_array = [my_dot, my_dot2, my_dot3] # this could be from the ACTUAL CLASS Dot @@array_all
    @dot_array_presentations = [my_dot.presentation, my_dot2.presentation, my_dot3.presentation] # ACTUAL CLASS Dot @@array_pres
    
    # then runs the title (shortly followed by introduction)

    title = Title.new
    title.display_title()
    title.request_details()

    # then runs the introduction

    introduction = TTY::Markdown.parse_file('../introduction.md')
    puts introduction

    # then offer the first menu, which is probably going to be an object ? First menu will have display of chest and then
    # perhaps a view map and select a cause.


    main_menu = MainMenu.new(@user_charity_chest_APP)
    main_menu.






    def initialize


        # classes instantiated in the application as all maps will have all dots and one charity chest

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