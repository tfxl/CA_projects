require 'tty-prompt'
require './charity_chest'

class MainMenu

    attr_reader :menu_options

    def initialize(charity_chest)

        @user_name = self.request_details
        @user_charity_chest_MENU = charity_chest

        @menu_options = ["1. View All Causes", "2. Add Some Coins to Your Charity Chest", "3. Join A Group"]

    end

   
    def request_details()

        name_prompt = TTY::Prompt.new

        puts "
        Welcome to AFRICAN CHARITY CALLENGE
        "
     
        name_prompt.ask("What is your name?") do |q|
            q.required(true, 'Please provide a username')
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

    end

end

# moneys = CharityChest.new

# bob = MainMenu.new(moneys)
# bob.display_menu