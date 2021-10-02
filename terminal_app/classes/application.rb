

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

    @updated_good_causes = nil
    @updated_charity_coins = nil
    @updated_budget = nil

    @number_causes_completed = 0

  end



################ ASSIGN DATA FROM JSON FILE TO FILEHANDLER ATTRIBUTES ################## 


def assign_data 

  @file.upload_data_from_file  # data now stored in FileHandler attributes

  @updated_good_causes = @file.good_causes_array
  # @updated_charity_coins = @file.charity_coins
  # @updated_budget = @file.budget
  @main_menu.user_name = @file.username
  

end



def create_charity_chest # now data is filled in
  @charity_chest = CharityChest.new(@file.charity_coins, @file.budget)
  update_number_completed()
  check_sponsorship()
end

 ################ UPDATE CHECK ON NUMBERS COMPLETED AND SPONSORSHIP OPTION ################## 

 def update_number_completed

  @file.good_causes_array.each do |good_cause|
    if good_cause.completed == true
      @number_causes_completed += 1
    end
  end
end


def check_sponsorship
  case @number_causes_completed
  when 5, 10, 15, 20
    @charity_chest.group_sponsors_available = true
  end
end

################ RUN and CLOSE TITLE. INTRODUCTION. LAUNCH MAIN MENU ################## 

def run_setup_to_main_menu
  # @title.display_title # title displayed and then closed
  # @title.close_title
  # @introduction.provide_introduction('./introduction.md') #introduction using filepath as nominated (this directory works)
  @main_menu.username_to_menu_process # username taken and menu launched
end

################ CHARITY CHEST NAVIGATION ##################

def charity_chest_navigation

  @charity_chest.display_chest
  @charity_chest.charity_chest_menu

  if @charity_chest.more_coins_options[0] == @charity_chest.charity_chest_menu_choice #Buy coins
    @charity_chest.use_bank_account

  elsif @charity_chest.more_coins_options[1] == @charity_chest.charity_chest_menu_choice #Earn Coins
    @charity_chest.do_work

  elsif @charity_chest.more_coins_options[2] == @charity_chest.charity_chest_menu_choice #Group Contribution
    update_number_completed()
    check_sponsorship()
    @charity_chest.seek_group_contribution(@number_causes_completed)

  elsif @charity_chest.more_coins_options[3] #== @charity_chest.charity_chest_menu_choice #Return to Main
    @main_menu.return_to_main()

  end

end


################ APPLY ACTIONS TO MENU SELECTION ##################

def apply_menu_selection

  case @main_menu.menu_selection 

  when @main_menu.menu_options[0] # VIEW ALL CAUSES ON MAP
    # do this

  when @main_menu.menu_options[1] # VIEW CHARITY CHEST
    charity_chest_navigation()
 
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