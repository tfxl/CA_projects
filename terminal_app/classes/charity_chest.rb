class CharityChest

    attr_accessor :coins

    def initialize()
        @coins = 1000
    end

    def increase_coins(amount)
        @coins = @coints + amount
    end

    def decrease_coins(amount)
        @coins = @coins - amount
    end


    def display_chest
        # ascii art

        spacing = " "*32 #can use formatting in due course
        

        puts "#{spacing}  ^^^^^^^^"
        puts "#{spacing}/__________\\"
        puts "#{spacing}|   #{@coins}   | "
        puts "#{spacing}|___COINS__|"

    end


end