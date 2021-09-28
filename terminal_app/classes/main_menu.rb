require 'tty-prompt'
require './charity_chest'

class MainMenu

    attr_reader :menu_options, :menu_selection

    def initialize(charity_chest)

        @user_name = self.request_details
        @user_charity_chest_MENU = charity_chest

        @menu_options = ["1. View All Causes", "2. Add Some Coins to Your Charity Chest", "3. Join A Group", "4. Exit"]

        @menu_selection = "placeholder for initiation only"

    end

   
    def request_details()

        name_prompt = TTY::Prompt.new

        puts "
        Welcome to AFRICAN CHARITY CALLENGE
        "
     
        name_prompt.ask("What is your name?") do |q|
            q.required(true, 'Please provide a name')
            # q.validate(/\A[^.]+\.[^.]+\Z/, "Please only enter letter characters")
            # q.validate(/[\d.]+/, 'Invalid entry')  # using a REGEX to check for character entry ?? *CHANGE REGEX expression as needed
        end
            
    end


    def display_menu()  #DRAW A BOX AROUND THIS IF FEASIBLE
        
        spacing = " "*24 #use formatting in due course

        puts "
        #{spacing}Name : #{@user_name}
        "

        @user_charity_chest_MENU.display_chest

        puts "
        ENJOY THIS PLACEHOLDER LABEL FOR SOMETHING ELSE IN DUE COURSE. UNSURE WHAT :)
        "

        # choices = ["1. View All Causes", "2. Add Coins to Your Charity Chest", "3. Join A Group"]

        prompt = TTY::Prompt.new
        user_choice = prompt.select('Please select one of the options', @menu_options)

        @menu_selection = user_choice
        puts "Here is the class menu selection #{@menu_selection}"

    end


    def return_to_main()

        prompt = TTY::Prompt.new
        prompt.keypress("Press space or enter to continue", keys: [:space, :return])
        self.display_menu

    end

end

# moneys = CharityChest.new

# bob = MainMenu.new(moneys)
# bob.display_menu