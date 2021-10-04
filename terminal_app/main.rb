require_relative './classes/dimension_checker'
require_relative './classes/application'

about_line = "ABOUT: This application is designed as a concept demonstration of a charity donation challenge, to assist communities in need in the African continent"
start_instruction = "If you want to run the program,\n1. please ensure you are in the application directory, \n2. AND type 'ruby main.rb' into the terminal without any arguments/parameters, \n3. OR try './run_app.sh' which should execute the program for you\n\n"

case ARGV[0]

when nil # run the program as normal

  dimensions = DimensionChecker.new # checks if terminal window dimensions are adequate for application
  dimensions.ensure_dimensions

  application = Application.new
  application.assign_data
  application.create_charity_chest
  application.update_map_rows
  application.run_setup_to_main_menu

  while true
    application.apply_menu_selection
  end

when "without" # run the program without the dimension checker
  application = Application.new
  application.all_application_start_ups

  while true
    application.apply_menu_selection
  end

when "help"
  system("clear") || system("cls")
  puts "\n\n==> #{about_line}\n\n"

  puts "==> #{start_instruction}"

  puts "==> If you are running directly from 'ruby main.rb' please ensure you have installed the 'bundler' gem with the 'gem bundler install' command in terminal\n\n"
  puts "==> Please note that the alternative run from executable script './run_app.sh' will attempt an install of the 'bundler' gem if not seen in your list of installed Ruby gems\n\n"

  puts "==> To avoid the terminal dimension checker"
  puts "1. ensure you are in the application directory"
  puts "2. type   'ruby main.rb without'  and it will skip this check."
  puts "(This is not recommended as it will affect the display of the ascii art)\n\n"

when "about"
  system("clear") || system("cls")
  puts "\n\n==> #{about_line}\n\n"

when "install"
  system("clear") || system("cls")
  puts "There is no need to install the main.rb file"
  puts puts "==> #{start_instruction}"

when "version"
  puts "No version number exists for this program currently"

when "v"
  puts "No version number exists for this program currently"

else
  system("clear") || system("cls")
  puts "\nSorry, that operation/argument is not recognised!\n\n"
  puts "To view some additional information, try 'ruby main.rb help'"
  puts start_instruction
  
end










