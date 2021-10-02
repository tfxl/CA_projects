

# require_relative './classes/dimension_checker'
require_relative './file_handler'
require_relative './title'
require_relative './introduction'
require_relative './main_menu'
require_relative './charity_chest'


class Application

  def initialize

    @file = FileHandler.new
    @title = Title.new
    @introduction = Introduction.new
    @main_menu = MainMenu.new

    @charity_chest = CharityChest.new(@file.charity_coins, @file.budget)

    @updated_good_causes = nil
    @updated_charity_coins = nil
    @updated_budget = nil

  end

 ################ ASSIGN DATA FROM JSON FILE TO FILEHANDLER ATTRIBUTES ################## 

def assign_data 

  @file.upload_data_from_file  # data now stored in FileHandler attributes

  @updated_good_causes = @file.good_causes_array
  @updated_charity_coins = @file.charity_coins
  @updated_budget = @file.budget
  @main_menu.user_name = @file.username

end

def new_main_menu
  @main_menu = MainMenu.new(@main_file.username)
end

################ RUN and CLOSE TITLE. INTRODUCTION. LAUNCH MAIN MENU ################## 

def run_setup_to_main_menu
  # @title.display_title # title displayed and then closed
  # @title.close_title
  #@introduction.provide_introduction('./introduction.md') #introduction using filepath as nominated (this directory works)
  @main_menu.username_to_menu_process # username taken and menu launched
end



################ APPLY ACTIONS TO MENU SELECTION ##################

def apply_menu_selection
  puts @main_menu.menu_selection
  puts @main_menu.menu_selection[4]

  case @main_menu.menu_selection 

  when @main_menu.menu_options[0] # VIEW ALL CAUSES ON MAP
    # do this

  when @main_menu.menu_options[1] # VIEW CHARITY CHEST
    @charity_chest.draw_charity_chest
    #do this GO TO CHARITY CHEST

  when @main_menu.menu_options[2] # SEE SUPPORTED CAUSES
    #do this SEE CAUSES

  when @main_menu.menu_options[3] # SAVE FILE
    puts "save file from main"
    # @main_menu.save_file_from_main(@updated_good_causes, @updated_charity_coins, @updated_budget)

  when @main_menu.menu_options[4] # EXIT FROM APPLICATION
    @main_menu.exit_from_main(@updated_good_causes, @updated_charity_coins, @updated_budget)

  end

end


############################# END CLASS ##################################

end