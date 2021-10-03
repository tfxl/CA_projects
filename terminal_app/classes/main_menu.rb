require 'tty-prompt'
require 'rainbow'

class MainMenu

  attr_reader :menu_selection, :menu_options
  attr_accessor :user_name

  def initialize

    @user_name = nil
    @prompt = TTY::Prompt.new

    @menu_options = [
      "1. #{Rainbow('View All Charity Causes').darkolivegreen}",
      "2. #{Rainbow('Go to your Charity Chest').darkolivegreen}",
      "3. #{Rainbow('See the Causes You have Supported').darkolivegreen}", 
      "4. #{Rainbow('Save Progress').darkolivegreen}", 
      "5. #{Rainbow('Exit').darkolivegreen}"]

    @menu_selection = nil

  end

############################# REQUEST USERNAME IF NEW FILE #################################

  def establish_username

    if @user_name == "__default__"

      name_prompt = TTY::Prompt.new # this needed to be created again, as .ask method did not work off attribute @prompt
      puts Rainbow("\n\nWelcome to AFRICAN CHARITY CALLENGE\n\n").orange
  
      @user_name = name_prompt.ask('What is your name?') do |name|
        name.required(true, 'Please provide a name')
        name.validate(/[a-zA-Z_]/, 'Please only use letters for your name. Underscores are ok')
      end
    end
  end

  ############################# WELCOME USER #################################
     
  def welcome_user # keep only if adding an additional content

    puts "Welcome #{user_name}"

    # ascii art something here : a welcome ?

  end

   ############################# DISPLAY MAIN MENU  #################################
 

  def display_menu
    spacing = ' ' * 24 # consider centering

    puts Rainbow("
        #{spacing}Name : #{@user_name}  | |  AFRICAN CHARITY CHALLENGE  | |  Thank you for supporting our mission
        ").orange

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
    system("clear") || system("cls")
    display_menu()
    menu_choice()
  end

  def return_to_main
    # @prompt.keypress(Rainbow('Please press space or enter to continue').orange.to_s, keys: %i[space return])
    system("clear") || system("cls")
    display_menu()
    menu_choice()
  end

    ############################# SAVE FROM MAIN MENU #################################

  def save_file_from_main(updated_good_causes, updated_charity_coins, updated_budget)
    file_handler = FileHandler.new
    file_handler.save_file(updated_good_causes, updated_charity_coins, updated_budget, @user_name)
    # a progress bar would be useful as an update
  end

   ############################# EXIT APPLICATION  #################################

  def exit_application
    puts Rainbow("\n\nThank you for your support\n\n").orange
      sleep 1 #maybe a progress bar instead of sleep
      exit
  end


############################# THE EXIT FROM APPLICATION MENU OPTION AND PROCESS #################################

  def exit_from_main(updated_good_causes, updated_charity_coins, updated_budget)

    system("clear") || system("cls")
    puts Rainbow("\n\nCaution. This will exit application. Please confirm your choice\n\n").red
 

    exit_options = [
      Rainbow("1. Return to Main Menu").darkolivegreen,
      Rainbow("2. Save Progress + Exit").darkolivegreen,
      Rainbow("3. Exit").red
    ]
 
    user_choice = @prompt.select('Please select one of the options', exit_options)
  
    case user_choice
    when exit_options[0]
      return_to_main()
    when exit_options[1]
      save_file_from_main(updated_good_causes, updated_charity_coins, updated_budget)
      exit_application()

    when exit_options[2]
      exit_application()
    end

  end


end