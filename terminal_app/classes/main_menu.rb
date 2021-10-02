require 'tty-prompt'
require 'rainbow'
# require './charity_chest'

class MainMenu

  attr_reader :menu_selection, :menu_options
  attr_accessor :user_name

  def initialize

    @user_name = nil
    @prompt = TTY::Prompt.new

    @menu_options = [
      "1. #{Rainbow('View All Charity Causes').yellow}",
      '2. Go to your Charity Chest',
      '3. See the Causes You have Supported', 
      '4. Save Progress', 
      '5. Exit']

    @menu_selection = nil

    

  end


############################# REQUEST USERNAME IF NEW FILE #################################


  def establish_username

    if @user_name == "__default__"

      name_prompt = TTY::Prompt.new # this needed to be created again, as .ask method did not work off attribute @prompt
      puts "
          Welcome to AFRICAN CHARITY CALLENGE
          "
  
      @user_name = name_prompt.ask('What is your name?') do |name|
        name.required(true, 'Please provide a name')
        name.validate(/[a-zA-Z_]/, 'Please only use letters for your name. Underscores are ok')
      end
    
    else 

      puts "Your username is currently #{@user_name}"



    end

  end

  ############################# WELCOME USER #################################
  
    
  def welcome_user # keep only if adding an additional content

    puts "Welcome #{user_name}"

    # ascii art something here : a welcome ?

  end

   ############################# DISPLAY MAIN MENU  #################################
 

  def display_menu # DRAW A BOX AROUND THIS IF FEASIBLE
    spacing = ' ' * 24 # consider centering

    puts Rainbow("
        #{spacing}Name : #{@user_name}  | |  AFRICAN CHARITY CHALLENGE  | |  Thank you for supporting our mission
        ").orange

    #ascii art

    # @user_charity_chest_MENU.display_chest
    # puts "\n#{'*' * 45}
    #     "
  end

  ############################# CREATE A MENU CHOICE  ################################# #combine with display menu ?
  
  def menu_choice

    user_choice = @prompt.select('Please select one of the options', @menu_options)
    @menu_selection = user_choice

  end

  ############################# COMBINING FUNCTIONS CHECK USERNAME AND RUN TO MENU #################################

  def username_to_menu_process
    establish_username()
    # welcome_user()
    display_menu()
    menu_choice()

  end

   ############################# RETURN TO MAIN MENU AND ALLOW MENU CHOICE #################################
  
   def return_to_main_after_keypress
    @prompt.keypress(Rainbow('Please press space or enter to continue').orange.to_s, keys: %i[space return])
    display_menu()
    menu_choice()
  end

  def return_to_main
    # @prompt.keypress(Rainbow('Please press space or enter to continue').orange.to_s, keys: %i[space return])
    display_menu()
    menu_choice()
  end

    ############################# SAVE FROM MAIN MENU #################################

  def save_file_from_main(updated_good_causes, updated_charity_coins, updated_budget)
    file_handler = FileHandler.new
    file_handler.save_file(updated_good_causes, updated_charity_coins, updated_budget)
    # a progress bar would be good here

  end

   ############################# EXIT APPLICATION  #################################

  def exit_application
    puts "Thank you for your support"
      sleep 1 #maybe a progress bar
      exit
  end


############################# THE EXIT FROM APPLICATION MENU OPTION AND PROCESS #################################

  def exit_from_main(updated_good_causes, updated_charity_coins, updated_budget)

    puts Rainbow("Caution. This will exit application. Please confirm your choice").red
 

    exit_options = [
      "1. Return to Main Menu",
      "2. Save Progress + Exit",
      "3. Exit"
    ]

    user_choice = @prompt.select('Please select one of the options', exit_options)
  
    case user_choice
    when exit_options[0]
      return_to_main()
    when exit_options[2]
      save_file_from_main(updated_good_causes, updated_charity_coins, updated_budget)
      exit_application()
      
    when exit_options[3]
      exit_application()
    end

  end


end