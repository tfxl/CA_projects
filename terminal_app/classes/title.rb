require 'rainbow'

class Title

    def display_title() #https://fsymbols.com/generators/carty/

        # delay = 0.15
        delay = 0.15

        print "
        #{Rainbow("░█████╗░███████╗██████╗░██╗░█████╗░░█████╗░███╗░░██╗").darkorange}"
        print "
        #{Rainbow("██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██╔══██╗████╗░██║").orange}"
        sleep(delay)
        print"
        #{Rainbow("███████║█████╗░░██████╔╝██║██║░░╚═╝███████║██╔██╗██║").darkgreen}"
        sleep(delay)
        print"
        #{Rainbow("██╔══██║██╔══╝░░██╔══██╗██║██║░░██╗██╔══██║██║╚████║").darkgreen}"
        sleep(delay)
        print "
        #{Rainbow("██║░░██║██║░░░░░██║░░██║██║╚█████╔╝██║░░██║██║░╚███║").orange}"
        sleep(delay)
        print"
        #{Rainbow("╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝").firebrick}\n"
        sleep(delay)
        print"
        #{Rainbow("░█████╗░██╗░░██╗░█████╗░██████╗░██╗████████╗██╗░░░██╗").orange}"
        sleep(delay)
        print"
        #{Rainbow("██╔══██╗██║░░██║██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗░██╔╝").orange}"
        sleep(delay)
        print"
        #{Rainbow("██║░░╚═╝███████║███████║██████╔╝██║░░░██║░░░░╚████╔╝░").darkgreen}"
        sleep(delay)
        print"
        #{Rainbow("██║░░██╗██╔══██║██╔══██║██╔══██╗██║░░░██║░░░░░╚██╔╝░░").darkgreen}"
        sleep(delay)
        print"
        #{Rainbow("╚█████╔╝██║░░██║██║░░██║██║░░██║██║░░░██║░░░░░░██║░░░").orange}"
        sleep(delay)
        print"
        #{Rainbow("░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░╚═╝░░░░░░╚═╝░░░").firebrick}\n"

        sleep(delay)
        print"
        #{Rainbow("░█████╗░██╗░░██╗░█████╗░██╗░░░░░██╗░░░░░███████╗███╗░░██╗░██████╗░███████╗").orange}"
        sleep(delay)
        print"
        #{Rainbow("██╔══██╗██║░░██║██╔══██╗██║░░░░░██║░░░░░██╔════╝████╗░██║██╔════╝░██╔════╝").orange}"
        sleep(delay)
        print"
        #{Rainbow("██║░░╚═╝███████║███████║██║░░░░░██║░░░░░█████╗░░██╔██╗██║██║░░██╗░█████╗░░").darkgreen}"
        sleep(delay)
        print"
        #{Rainbow("██║░░██╗██╔══██║██╔══██║██║░░░░░██║░░░░░██╔══╝░░██║╚████║██║░░╚██╗██╔══╝░░").darkgreen}"
        sleep(delay)
        print"
        #{Rainbow("╚█████╔╝██║░░██║██║░░██║███████╗███████╗███████╗██║░╚███║╚██████╔╝███████╗").orange}"
        sleep(delay)
        print"
        #{Rainbow("░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚══╝░╚═════╝░╚══════╝").firebrick}\n\n"


# could use a move cursor, and then puts, so the top is done too.
# could also centre the text, which TTY is able to complete


    end
end

# bob = Title.new
# bob.display_title()

