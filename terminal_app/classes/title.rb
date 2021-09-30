require 'rainbow'
require 'tty-screen'
require 'tty-cursor'

class Title

  def initialize

    @delay = 0.15
    @terminal_screen_size = TTY::Screen.size
    @height = @terminal_screen_size[0]
    @width = @terminal_screen_size[1]

    @cursor = TTY::Cursor

    @title = [
      "#{Rainbow("░█████╗░███████╗██████╗░██╗░█████╗░░█████╗░███╗░░██╗").darkorange}",
      "#{Rainbow("██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██╔══██╗████╗░██║").orange}",
      "#{Rainbow("███████║█████╗░░██████╔╝██║██║░░╚═╝███████║██╔██╗██║").darkgreen}",
      "#{Rainbow("██╔══██║██╔══╝░░██╔══██╗██║██║░░██╗██╔══██║██║╚████║").darkgreen}",
      "#{Rainbow("██║░░██║██║░░░░░██║░░██║██║╚█████╔╝██║░░██║██║░╚███║").orange}",
      "#{Rainbow("╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝").firebrick}\n",
      " ",
      " ",
      "#{Rainbow("░█████╗░██╗░░██╗░█████╗░██████╗░██╗████████╗██╗░░░██╗").orange}",
      "#{Rainbow("██╔══██╗██║░░██║██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗░██╔╝").orange}",
      "#{Rainbow("██║░░╚═╝███████║███████║██████╔╝██║░░░██║░░░░╚████╔╝░").darkgreen}",
      "#{Rainbow("██║░░██╗██╔══██║██╔══██║██╔══██╗██║░░░██║░░░░░╚██╔╝░░").darkgreen}",
      "#{Rainbow("╚█████╔╝██║░░██║██║░░██║██║░░██║██║░░░██║░░░░░░██║░░░").orange}",
      "#{Rainbow("░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░╚═╝░░░░░░╚═╝░░░").firebrick}\n",
      " ",
      " ",
      "#{Rainbow("░█████╗░██╗░░██╗░█████╗░██╗░░░░░██╗░░░░░███████╗███╗░░██╗░██████╗░███████╗").orange}",
      "#{Rainbow("██╔══██╗██║░░██║██╔══██╗██║░░░░░██║░░░░░██╔════╝████╗░██║██╔════╝░██╔════╝").orange}",
      "#{Rainbow("██║░░╚═╝███████║███████║██║░░░░░██║░░░░░█████╗░░██╔██╗██║██║░░██╗░█████╗░░").darkgreen}",
      "#{Rainbow("██║░░██╗██╔══██║██╔══██║██║░░░░░██║░░░░░██╔══╝░░██║╚████║██║░░╚██╗██╔══╝░░").darkgreen}",
      "#{Rainbow("╚█████╔╝██║░░██║██║░░██║███████╗███████╗███████╗██║░╚███║╚██████╔╝███████╗").orange}",
      "#{Rainbow("░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚══╝░╚═════╝░╚══════╝").firebrick}\n\n"
    ]

  end

  def position_cursor_for_centering(each_ascii_text_element, y_coordinate)
    length = each_ascii_text_element.chars.length
    x_coordinate = (@width - length) / 2
    print @cursor.move_to(x_coordinate, y_coordinate)
  end
  

  def display_title #ascii art from #https://fsymbols.com/generators/carty/

    system("clear") || system("cls")

    y_coordinate = 2

    @title.each do |iteration|
      y_coordinate += 1
      position_cursor_for_centering(iteration, y_coordinate)
      puts iteration

      sleep(@delay)
    end
  
  end

end

