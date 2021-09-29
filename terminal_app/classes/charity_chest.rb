require './ascii_art'
require 'tty-prompt'


class CharityChest

    attr_accessor :coins, :budget

    def initialize(starting, budget)
        @budget = budget
        @coins = starting
        @ascii_art = AsciiArt.new
        @prompt = TTY::Prompt.new
    end


    def increase_coins(amount)
        @coins = @coins + amount
    end


    def decrease_coins(amount)
        @coins = @coins - amount
    end


    def buy_charity_coins()
        puts "How much would you like to spend from your budget ? #{Rainbow("$10 for 100 Charity Coins").blue}"
        debit = @prompt.slider("$ amount", max: @budget, step: 5, default: 0, format: "|:slider| %d $ will be spent. #{Rainbow("You have $#{@budget} remaining in your budget").red}")
        @budget = @budget - debit
        increase_coins(debit*10)
        display_chest()
        puts "Thank you for your generosity. You now have an extra #{debit * 10} Charity Coins"
    end


    def display_chest
        print @ascii_art.charity_coins_title
        print @ascii_art.charity_chest_art 
        puts "Here's the financials => Budget #{@budget} and Charity Coins #{@coins}"
    end


    def return_coins_count 
        return @charity_coins
    end

    def return_budget_remaining
        return @budget
    end



end
