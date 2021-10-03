require 'tty-prompt'
require 'rainbow'

# require_relative './classes/dimension_checker'
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


    @updated_good_causes = nil
    @updated_charity_coins = nil
    @updated_budget = nil



    @supported_causes_array = []
    @map_array_display = []

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

  def update_map_rows
    @file.good_causes_array = @map.update_map(@file.good_causes_array) #creates map and allocates sections to the causes
    puts "(map rows updated)" # this is not just a debugger - it ensured data would transfer. Without it, it did not. 
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
      @map.run_cause_selector



      if @map.map_menu_choices[0] == @map.map_menu_selection

        if @map.chosen_cause.cost <= @charity_chest.coins
          @charity_chest.decrease_coins(@map.chosen_cause.cost)

          @file.good_causes_array.each do |cause| #update the main data (not SAVED, just updated)
            if cause == @map.chosen_cause
              cause.completed = true
            end
          end

          puts "THANK YOU FOR SUPPORTING THIS CAUSE"
          @prompt.keypress(Rainbow('Please press space or enter to continue').orange.to_s, keys: %i[space return])
          # will automatically return to main menu after this

        else 
          puts Rainbow("SORRY, YOU DO NOT HAVE ENOUGH CHARITY COINS AT THIS TIME").red
          @prompt.keypress(Rainbow('Please press space or enter to continue').orange.to_s, keys: %i[space return])
          # will automatically return to main menu after this

        end


      elsif @map.map_menu_choices[1] == @map.map_menu_selection
        
        puts "Go back to map"


      elsif @map.map_menu_choices[2] == @map.map_menu_selection
        # this will automatically return to main menu
      end


   













      @main_menu.return_to_main


     
  

    when @main_menu.menu_options[1] # VIEW CHARITY CHEST
      charity_chest_navigation()

      ###############################################  SEE PROGRESS  ############################################
  
    when @main_menu.menu_options[2] # SEE SUPPORTED CAUSES
      update_number_completed()
      case @supported_causes_array.length
      when 0 
        puts "YOU HAVE NOT SPONSORED ANY CHARITY CAUSES YET. YOUR SUPPORT WILL BE MOST WELCOME"
      when 1
        puts "THANK YOU FOR YOUR SUPPORT OF THIS GOOD CAUSE :"
      when 1..50
        puts "YOU HAVE HELPED A LOT; THANK YOU FOR SUPPORTING THESE CAUSES :"
      end

      @supported_causes_array.each do |cause|
        puts "You have supported #{cause.description} in #{cause.country}"
      end

      @main_menu.return_to_main_after_keypress()

      ###############################################  SAVE OR EXIT  ############################################

    when @main_menu.menu_options[3] # SAVE FILE
      puts "save file from main"
      # @main_menu.save_file_from_main(@updated_good_causes, @updated_charity_coins, @updated_budget)

    when @main_menu.menu_options[4] # EXIT FROM APPLICATION
      @main_menu.exit_from_main(@file.good_causes_array, @file.charity_coins, @file.budget)
    end

  end



###############################################  SELECT CAUSE FROM MAP  ############################################


  # def select_cause_from_map 
  #   prompt = TTY::Prompt.new # (active_color: :orange)

  #   @map_array_display = [] # needs to be reset otherwise will accumulate the displays
  #   @file.good_causes_array.each do |cause| # this will extract just the visual presentations of each cause
  #     @map_array_display << cause.presentation.chomp # and then put them into an array for prompt.select to work
  #   end

  #   # available = true
  #   # while available
  #     user_choice = prompt.select('Please select an area to view the charitable cause', @map_array_display)

  #     # @file.good_causes_array.each do |cause| # iterate through objects, and see if their presentation matches the picked one
  #     #   next unless cause.presentation.chomp == user_choice

  #     #   case cause.completed
  #     #   when true
  #     #     puts 'Thank you but you have already funded this cause. Please find another option'
  #     #     sleep 3
  #     #   when false
  #     #     available = false
  #     #     return cause # and if it does match, then return the object for further use
  #     #   end
  #     # end
  #   # end
  # end


  ############################# END CLASS ##################################

end



# def select_cause_from_map # (dot_array, dot_array_presentations)
#   prompt = TTY::Prompt.new # (active_color: :orange)

#   @map_array_display = [] # needs to be reset otherwise will accumulate the displays
#   @file.good_causes_array.each do |cause| # this will extract just the visual presentations of each cause
#     @map_array_display << cause.presentation.chomp # and then put them into an array for prompt.select to work
#   end

#   available = true
#   while available
#     user_choice = prompt.select('Choose the place', @map_array_display)

#     @file.good_causes_array.each do |cause| # iterate through objects, and see if their presentation matches the picked one
#       next unless cause.presentation.chomp == user_choice

#       case cause.completed
#       when true
#         puts 'Thank you but you have already funded this cause. Please find another option'
#         sleep 3
#       when false
#         available = false
#         return cause # and if it does match, then return the object for further use
#         end
#       end
#     end
#   end











  # puts "You have chosen an area in #{selected_cause.country}, #{selected_cause.area} Africa.
  #       This cause supports #{selected_cause.category} and you can #{selected_cause.description} for #{selected_cause.cost} Charity Coins\n\n"

  # sleep 5

  # prompt = TTY::Prompt.new
  # choices = ["1. Support the cause for #{selected_cause.cost} Charity Coins",
  #            '2. Find another cause to support', 
  #            '3. Return to Main Menu']




  # @user_charity_chest_APP.display_chest
  # user_choice = prompt.select('Would you like to support this cause ?', choices)
  # puts "\n"

  # ###############################################  PAY FOR A CAUSE ############################################


  # if user_choice == choices[0]

  #   if selected_cause.cost <= @user_charity_chest_APP.coins

  #     @user_charity_chest_APP.decrease_coins(selected_cause.cost)
  #     selected_cause.completed = true

  #     puts selected_cause.completed

  #     subsequent_update_map_components

  #     puts "Thank you for your support. You have just supported #{selected_cause.category} in #{selected_cause.country}"

  #     puts 'Your Charity Chest now contains:'
  #     @user_charity_chest_APP.display_chest
  #     puts "\n"
  #     sleep 2
  #     @main_menu.return_to_main

  #   else
  #     puts "We are sorry, you do not appear to have enough Charity Coins to support this cause
  #               Please have a look at some other options"
  #     @main_menu.return_to_main
  #   end

  #   ###############################################  NO MONEY TO PAY FOR CAUSE ############################################

  # elsif user_choice == choices[1]

  #   "No worries. Let's have a look at the other options"

  #   ###############################################  OPTIONAL RETURN TO MAIN MENUE ############################################

  # elsif user_choice == choices[2]
  #   @main_menu.display_menu
  # end