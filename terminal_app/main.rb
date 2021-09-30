# require 'json'
# require_relative './classes/dot'
# require_relative './classes/application'
# require_relative './classes/application'
require_relative './classes/dimension_checker'
require_relative './classes/file_handler'
require_relative './classes/title'
require_relative './classes/introduction'


# my_application = Application
# my_application.initial_update_map_components

# my_application.run_setup_to_main_menu

# while true
#   my_application.menu_selection
#   my_application.run_menu_selections
# end

############## CHECK IF TERMINAL WINDOW DIMENSIONS ARE ADEQUATE FOR PROGRAM ##################################

dimensions = DimensionChecker.new
dimensions.ensure_dimensions


############################# OPEN NEW AND UPLOAD DATA ##################################

test_file = FileHandler.new
test_file.upload_data_from_file

test_file.iterate_my_data

############################# RUN TITLE ##################################

title = Title.new
title.display_title

############################### DISPLAY INTRODUCTION #################################

introduction = Introduction.new 
introduction.provide_introduction('./introduction.md')

################################# MAIN MENU ##########################################






################# RUN THE APPLICATION NOW, WHICH WILL RUN WITHIN ITSELF ##################








