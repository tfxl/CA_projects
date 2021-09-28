require './ascii_art'


class CharityChest

    attr_accessor :coins

    def initialize()
        @coins = 1000
        @ascii_art = AsciiArt.new
    end

    def increase_coins(amount)
        @coins = @coins + amount
    end

    def decrease_coins(amount)
        @coins = @coins - amount
    end


    def display_chest
        # ascii art


        print @ascii_art.charity_coins_title
        print @ascii_art.charity_chest_art

     
    end


end
