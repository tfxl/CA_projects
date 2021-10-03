require_relative './classes/dimension_checker'
require_relative './classes/application'


############## CHECK IF TERMINAL WINDOW DIMENSIONS ARE ADEQUATE FOR PROGRAM ##################################

# dimensions = DimensionChecker.new
# dimensions.ensure_dimensions

application = Application.new
application.assign_data
application.create_charity_chest
application.update_map_rows
application.run_setup_to_main_menu

while true
  application.apply_menu_selection
end












