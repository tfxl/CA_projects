# require 'json'
# require_relative './classes/dot'
# require_relative './classes/application'
require_relative './classes/application'



# my_application = Application
# my_application.initial_update_map_components

# my_application.run_setup_to_main_menu

# while true
#   my_application.menu_selection
#   my_application.run_menu_selections



# end

############## CHECK IF TERMINAL WINDOW DIMENSIONS ARE ADEQUATE FOR PROGRAM ##################################

# dimensions = DimensionChecker.new
# dimensions.ensure_dimensions


############################# OPEN NEW AND UPLOAD DATA ##################################

# main_file = FileHandler.new
# main_file.upload_data_from_file


############################# RUN TITLE ##################################

# title = Title.new
# title.display_title
# title.close_title

############################### DISPLAY INTRODUCTION #################################

# introduction = Introduction.new 
# introduction.provide_introduction('./introduction.md')

################################# MAIN MENU ##########################################

# main_menu = MainMenu.new("BOBR")
# main_menu = MainMenu.new(main_file.username)
# main_menu.username_to_menu_process


# ################ RUN THE APPLICATION NOW, WHICH WILL RUN WITHIN ITSELF ##################



application = Application.new
application.assign_data
application.create_charity_chest
application.update_map_rows
# puts application.map.

application.run_setup_to_main_menu

while true
  application.apply_menu_selection
end



  













