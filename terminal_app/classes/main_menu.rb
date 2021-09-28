require 'tty-prompt'
require './charity_chest'

class MainMenu

    attr_reader :menu_options, :menu_selection

    def initialize(charity_chest)

        @user_name = self.request_details
        @user_charity_chest_MENU = charity_chest

        @menu_options = ["1. View All Causes", "2. Add Some Coins to Your Charity Chest", "3. Join A Group", "4. Exit"]

        @menu_selection = "placeholder for initiation only"

        @prompt = TTY::Prompt.new
    end

   
    def request_details()

        name_prompt = TTY::Prompt.new # this needed to be created again, as .ask method did not work off attribute @prompt
        puts "
        Welcome to AFRICAN CHARITY CALLENGE
        "
     
        name_prompt.ask("What is your name?") do |q|
            q.required(true, 'Please provide a name')
            q.validate(/[a-zA-Z_]/, "Please only use letters for your name. Underscores are ok")
            # q.validate(/\A[^.]+\.[^.]+\Z/, "Please only enter letter characters")

        end            
    end


    def display_menu()  #DRAW A BOX AROUND THIS IF FEASIBLE
        
        spacing = " "*24 #use formatting in due course

        puts Rainbow("
        #{spacing}Name : #{@user_name}  | |  AFRICAN CHARITY CHALLENGE  | |  Thank you for supporting
        ").orange

        @user_charity_chest_MENU.display_chest
        puts "\n#{"*"*45}
        "

        user_choice = @prompt.select('Please select one of the options', @menu_options)
        @menu_selection = user_choice
    end


    def return_to_main()
        @prompt.keypress("#{Rainbow("Please press space or enter to continue").orange}", keys: [:space, :return])
        self.display_menu
    end

end
