require 'tty-prompt'
require 'rainbow'

require_relative './file_handler'
require_relative './title'
require_relative './introduction'
require_relative './main_menu'
require_relative './charity_chest'
require_relative './map'


class Application

  def initialize

    @file = FileHandler.new
    @title = Title.new
    @introduction = Introduction.new
    @main_menu = MainMenu.new
    @map = Map.new
    @prompt = TTY::Prompt.new

    @supported_causes_array = []
    @map_array_display = []

  end

 ################ ASSIGN DATA FROM JSON FILE TO FILEHANDLER ATTRIBUTES ################## 


  def assign_data 

    @file.upload_data_from_file  # data now stored in FileHandler attributes
    @main_menu.user_name = @file.username
  
  end

  def create_charity_chest # now data is filled in
    @charity_chest = CharityChest.new(@file.charity_coins, @file.budget)
    update_number_completed()
    check_sponsorship()
  end

  def update_map_rows
    @file.good_causes_array = @map.update_map(@file.good_causes_array) # creates map and allocates sections to the causes
  end


 ################ UPDATE CHECK ON NUMBERS COMPLETED AND SPONSORSHIP OPTION ################## 

def update_number_completed

  @supported_causes_array = []
  @file.good_causes_array.each do |good_cause|
    if good_cause.completed == true
      @supported_causes_array << good_cause
    end
  end
end


def check_sponsorship
  case @supported_causes_array.length
  when 5, 10, 15, 20
    @charity_chest.group_sponsors_available = true
  end
end

################ RUN and CLOSE TITLE. INTRODUCTION. LAUNCH MAIN MENU ################## 

def run_setup_to_main_menu
  @title.display_title
  @title.close_title
  @introduction.provide_introduction('./data/introduction.md')
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
    @charity_chest.seek_group_contribution(@supported_causes_array.length)

  elsif @charity_chest.more_coins_options[3] #== @charity_chest.charity_chest_menu_choice #Return to Main
    @main_menu.return_to_main()

  end

end


################ APPLY ACTIONS TO MENU SELECTION ##################

  def apply_menu_selection

    case @main_menu.menu_selection 

    when @main_menu.menu_options[0] # VIEW ALL CAUSES ON MAP

      update_map_rows()
      @map.good_causes_array = @file.good_causes_array
      @map.update_display_array(@file.good_causes_array)
      @map.draw_map(@file.good_causes_array)
      @map.run_cause_selector

      if @map.map_menu_choices[0] == @map.map_menu_selection # selected to support with Charity Coins

        if @map.chosen_cause.cost <= @charity_chest.coins
          @charity_chest.decrease_coins(@map.chosen_cause.cost)

          @file.good_causes_array.each do |cause| # update the main data (not SAVED, just updated)
            if cause == @map.chosen_cause
              cause.completed = true
              new_value = @map.colour_the_dots(cause.presentation, cause) # need to use this method, as update_map_rows unable to achieve by itself
              cause.presentation = new_value
            end
          end
          update_map_rows()

          puts Rainbow("THANK YOU FOR SUPPORTING THIS CAUSE").red
          # will automatically return to main menu after this

        else 
          puts Rainbow("SORRY, YOU DO NOT HAVE ENOUGH CHARITY COINS AT THIS TIME").red
          # will automatically return to main menu after this

        end
        @prompt.keypress(Rainbow('Please press space or enter to continue').orange.to_s, keys: %i[space return])


      elsif @map.map_menu_choices[1] == @map.map_menu_selection # back to map
        @map.draw_map(@file.good_causes_array)
        @map.run_cause_selector

      elsif @map.map_menu_choices[2] == @map.map_menu_selection
        # this will automatically return to main menu
      end

      @main_menu.return_to_main


    when @main_menu.menu_options[1] # VIEW CHARITY CHEST
      charity_chest_navigation()

      ###############################################  SEE PROGRESS  ############################################
  
    when @main_menu.menu_options[2] # SEE SUPPORTED CAUSES
      update_number_completed()
      system("clear") || system("cls")
      case @supported_causes_array.length
      when 0 
        puts Rainbow("YOU HAVE NOT SPONSORED ANY CHARITY CAUSES YET. YOUR SUPPORT WILL BE MOST WELCOME\n\n").red
      when 1
        puts Rainbow("THANK YOU FOR YOUR SUPPORT OF THIS GOOD CAUSE :\n\n").orange
      when 1..50
        puts Rainbow("YOU HAVE HELPED A LOT; THANK YOU FOR SUPPORTING THESE CAUSES :\n\n").orange
      end

      @supported_causes_array.each do |cause|
        puts "Your support has helped to #{cause.description} in #{cause.country}"
      end

      @main_menu.return_to_main_after_keypress()

      ###############################################  SAVE OR EXIT  ############################################

    when @main_menu.menu_options[3] # SAVE FILE
      @main_menu.save_file_from_main(@file.good_causes_array, @charity_chest.coins, @charity_chest.budget)
      puts Rainbow("\n\nPROGRESS SAVED\n\n").orange
      @main_menu.return_to_main_after_keypress()

    when @main_menu.menu_options[4] # EXIT FROM APPLICATION
      @main_menu.exit_from_main(@file.good_causes_array, @charity_chest.coins, @charity_chest.budget)
    end

  end

  def all_application_start_ups
    assign_data()
    create_charity_chest()
    update_map_rows()
    run_setup_to_main_menu()
  end

  ############################# END CLASS ##################################

end

