class AsciiArt      # https://ascii.co.uk/art/treasure
                    # https://fsymbols.com/generators/carty/

    attr_reader :zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :nada

    attr_accessor :multiplier, :charity_coins_title, :charity_chest_art,  :y1, :y2, :y3, :y4

    def initialize

        @spacing = " "*1
        @multiplier = 3
        @low_brick_odd = "_______/"
        @low_brick_even = "___/____"

        @high_brick_vertical_odd = ["#{" "*5}|   ", "#{" "*5}|#{" "*11}", "#{" "*5}|#{" "*19}"]
        @high_brick_vertical_even = ["#{" "*8}", "#{" "*15}|", "#{" "*15}|#{" "*8}"]

        @high_brick_odd = ["#{"_"*5}|__", "#{"_"*5}|#{"_"*10}", "#{"_"*5}|#{"_"*18}"]
        @high_brick_even = ["#{"_"*8}", "#{"_"*15}|", "#{"_"*15}|#{"_"*8}"]

        @stars = "********"



        @zero = [
            "░█████╗░",
            "██╔══██╗",
            "██║░░██║",
            "██║░░██║",
            "╚█████╔╝",
            "░╚════╝░",
            "░░░░░░░░"
            ]
    
        @one = [  
            "░░███╗░░",
            "░████║░░",
            "██╔██║░░",
            "╚═╝██║░░",
            "███████╗",
            "╚══════╝",
            "░░░░░░░░"
            ]

        @two = [
            "██████╗░",
            "╚════██╗",
            "░░███╔═╝",
            "██╔══╝░░",
            "███████╗",
            "╚══════╝",
            "░░░░░░░░"
            ]

            @three = [
            "██████╗░",
            "╚════██╗",
            "░█████╔╝",
            "░╚═══██╗",
            "██████╔╝",
            "╚═════╝░",
            "░░░░░░░░"
            ]

            @four = [
            "░░██╗██╗",
            "░██╔╝██║",
            "██╔╝░██║",
            "███████║",
            "╚════██║",
            "░░░░░╚═╝",
            "░░░░░░░░"
            ]

            @five = [
            "███████╗",
            "██╔════╝",
            "██████╗░",
            "╚════██╗",
            "██████╔╝",
            "╚═════╝░",
            "░░░░░░░░"
            ]

            @six = [
            "░█████╗░",
            "██╔═══╝░",
            "██████╗░",
            "██╔══██╗",
            "╚█████╔╝",
            "░╚════╝░",
            "░░░░░░░░"
            ]

            @seven = [
            "███████╗",
            "╚════██║",
            "░░░░██╔╝",
            "░░░██╔╝░",
            "░░██╔╝░░",
            "░░╚═╝░░░",
            "░░░░░░░░"
            ]

            @eight = [
            "░█████╗░",
            "██╔══██╗",
            "╚█████╔╝",
            "██╔══██╗",
            "╚█████╔╝",
            "░╚════╝░",
            "░░░░░░░░"
            ]

            @nine =[
            "░█████╗░",
            "██╔══██╗",
            "╚██████║",
            "░╚═══██║",
            "░█████╔╝",
            "░╚════╝░",
            "░░░░░░░░"
            ]

            @nada =[
                "",
                "",
                "",
                "",
                "",
                "",
                ""
                ]



        @y1 = @zero
        @y2 = @one
        @y3 = @zero
        @y4 = @zero
        @y5 = "Condition ensuring cap of $9995 currently in place"


        @charity_coins_title = "
        #{@spacing*12}#{Rainbow("░█████╗░██╗░░██╗░█████╗░██████╗░██╗████████╗██╗░░░██╗░░░░█████╗░░█████╗░██╗███╗░░██╗░██████╗").yellow}
        #{@spacing*12}#{Rainbow("██╔══██╗██║░░██║██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗░██╔╝░░░██╔══██╗██╔══██╗██║████╗░██║██╔════╝").yellow}
        #{@spacing*12}#{Rainbow("██║░░╚═╝███████║███████║██████╔╝██║░░░██║░░░░╚████╔╝░░░░██║░░╚═╝██║░░██║██║██╔██╗██║╚█████╗░").yellow}
        #{@spacing*12}#{Rainbow("██║░░██╗██╔══██║██╔══██║██╔══██╗██║░░░██║░░░░░╚██╔╝░░░░░██║░░██╗██║░░██║██║██║╚████║░╚═══██╗").yellow}
        #{@spacing*12}#{Rainbow("╚█████╔╝██║░░██║██║░░██║██║░░██║██║░░░██║░░░░░░██║░░░░░░╚█████╔╝╚█████╔╝██║██║░╚███║██████╔╝").yellow}
        #{@spacing*12}#{Rainbow("░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░╚═╝░░░░░░╚═╝░░░░░░░╚════╝░░╚════╝░╚═╝╚═╝░░╚══╝╚═════╝░").yellow}
        "


    end

    def draw_charity_chest 
        
        @charity_chest_art =
        %Q(
            #{@spacing}#{Rainbow("#{"*"*5}").orange}#{Rainbow("#{"*"*2}").firebrick}#{Rainbow("#{"*"*5}").darkgreen}#{Rainbow("#{"*"*5}").darkorange}#{Rainbow("#{"*"*2}").darkblue}#{Rainbow("#{"*"*5}").darkorange}#{Rainbow("#{"*"*5}").darkgreen}#{Rainbow("#{"*"*10}").darkorange}#{Rainbow("#{"*"*10}").darkgreen}#{Rainbow("#{"*"*40}#{@stars * @multiplier}").darkorange}
            #{@spacing}         |                   |                  |                     |                #{@high_brick_vertical_odd[@multiplier - 1]}
            #{@spacing}_________|________________.=""_;=.______________|_____________________|________________#{@high_brick_odd[@multiplier - 1]}
            #{@spacing}|                   |  ,-"_,=""     `"=.|                  |                     |     #{@high_brick_vertical_even[@multiplier - 1]}
            #{@spacing}|___________________|__"=._o`"-._        `"=.______________|_____________________|_____#{@high_brick_even[@multiplier - 1]}
            #{@spacing}         |                `"=._o`"=._      _`"=._                     |                #{@high_brick_vertical_odd[@multiplier - 1]}
            #{@spacing}_________|_____________________:=._o "=._."_.-="'"=.__________________|________________#{@high_brick_odd[@multiplier - 1]}
            #{@spacing}|                   |    __.--" , ; `"=._o." ,-"""-._ ".   |    #{Rainbow("#{@y1[0]}#{@y2[0]}#{@y3[0]}#{@y4[0]}").orange}
            #{@spacing}|___________________|_._"  ,. .` ` `` ,  `"-._"-._   ". "__|____#{Rainbow("#{@y1[1]}#{@y2[1]}#{@y3[1]}#{@y4[1]}").orange}_______________
            #{@spacing}          |           |o`"=._` , "` `; .". ,  "-._"-._; ;       #{Rainbow("#{@y1[2]}#{@y2[2]}#{@y3[2]}#{@y4[2]}").orange}       |
            #{@spacing} _________|___________| ;`-.o`"=._; ." ` "`."` . "-._ /_________#{Rainbow("#{@y1[3]}#{@y2[3]}#{@y3[3]}#{@y4[3]}").orange}_______|_______
            #{@spacing}|                   | |o;    `"-.o`"=._``  '` " ,__.--o;   |    #{Rainbow("#{@y1[4]}#{@y2[4]}#{@y3[4]}#{@y4[4]}").orange}
            #{@spacing}|___________________|_| ;     (#) `-.o `"=.`_.--"_o.-; ;___|____#{Rainbow("#{@y1[5]}#{@y2[5]}#{@y3[5]}#{@y4[5]}").orange}_______________
            #{@spacing}____/______/______/___|o;._    "      `".o|o_.--"    ;o;____/___#{Rainbow("#{@y1[6]}#{@y2[6]}#{@y3[6]}#{@y4[6]}").gray}___/______/____
            #{@spacing}/______/______/______/_"=._o--._        ; | ;        ; ;/______/______/______/________/#{@low_brick_odd * @multiplier}
            #{@spacing}____/______/______/______/__"=._o--._   ;o|o;     _._;o;____/______/______/________/___#{@low_brick_even * @multiplier}
            #{@spacing}/______/______/______/______/____"=._o._; | ;_.--"o.--"_/______/______/______/________/#{@low_brick_odd * @multiplier}
            #{@spacing}____/______/______/______/______/_____"=.o|o_.--""___/______/______/______/________/___#{@low_brick_even * @multiplier}
            #{@spacing}/______/______/______/______/______/______/______/______/______/______/[TomekK]_______/#{@low_brick_odd * @multiplier}
            #{@spacing}#{Rainbow("#{"*"*5}").orange}#{Rainbow("#{"*"*2}").firebrick}#{Rainbow("#{"*"*5}").darkgreen}#{Rainbow("#{"*"*5}").darkorange}#{Rainbow("#{"*"*2}").darkblue}#{Rainbow("#{"*"*5}").darkorange}#{Rainbow("#{"*"*5}").darkgreen}#{Rainbow("#{"*"*10}").darkorange}#{Rainbow("#{"*"*10}").darkgreen}#{Rainbow("#{"*"*40}#{@stars * @multiplier}").darkorange}
            )

        print @charity_chest_art

    end


    def draw_elephant

        @elephant = 
        %Q(

        .. ..oooo.....ooo...
        .odSS4PYYYSSOOXXXXXXXXXOodbgooo.
       /SSYod$$$$SSOIIPXXXXXXXXXYYP.oo.*b.
      ($$Yd$$$$SSSOII:XXXXXXXX:IIoSSS$$b.Y,
       {Yd$$$$SSSOII:XXXXXXXXXX:IIOOSSS$$$b}
        d$$$$SSSOOI:XP"YXXXXXXXX:IIOOSSSS$$$}
        Y$$$SSSOOII:XbdXXXXXP"YX:IIOOOSS$$$$)
        'Y$$$SSSOI:XXXXXXXXXbodX:IIOOSS$$$$$/
         "Y$$$SSSOI(PoTXXXXXTo)XXIIOOOSS$$$*'
           ""*Y$S(((PXXXXXXXY))dIIOSSS$$dP'
              "*'()P;XXXXXXXXY)IIOSSS$P".oS,
              (S'(P;XXXXXXXP;Y)XXYOP".oSSSSb
             (S'(P;'XXXXXXX';Y).ooooSSSSSSSS))
             (S'(P;'XXXXXXP';Y).oSSSSSSSSSSSP
             (SS'Y);YXXXXX';(Y.oSSSSSSSSSSSSP
              YSS'Y)'YXXX".(Y.oSSP.SSSSSSSSY
               YSS'"" XXX""oooSSP.SSSSSSSSY
               SSSSSS YXXX:SSSSP.SSSSSSSSY
               SSSSSP  YXb:SSSP.S"SSSSSSP
               S(OO)S   YXb:SY    )SSSSS
               SSSSO    )YXb.I    ISSSSP
               YSSSY    I."YXXb   Y(SS)I
               {SSS}   dSSo.""*b  YSSSY
               OooSb   dSSSSP     {SSS}
                       dSSSY       OooSS
                       OooSP                 #{Rainbow("Beate Schwichtenberg").darkolivegreen})
                       

        print Rainbow(@elephant).red
        puts "\n\n"

    end

end

