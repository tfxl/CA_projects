# require 'json'
# require_relative './classes/dot'
# require_relative './classes/application'
# require_relative './classes/application'
require_relative './classes/file_handler'


# my_application = Application
# my_application.initial_update_map_components

# my_application.run_setup_to_main_menu

# while true
#   my_application.menu_selection
#   my_application.run_menu_selections
# end



test_file = FileHandler.new
test_file.upload_data_from_file

test_file.iterate_my_data