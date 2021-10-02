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
      "#{Rainbow("╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝").firebrick}",
      "\n",
      "#{Rainbow(" ░█████╗░██╗░░██╗░█████╗░██████╗░██╗████████╗██╗░░░██╗").orange}",
      "#{Rainbow(" ██╔══██╗██║░░██║██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗░██╔╝").orange}",
      "#{Rainbow("██║░░╚═╝███████║███████║██████╔╝██║░░░██║░░░░╚████╔╝░").darkgreen}",
      "#{Rainbow("██║░░██╗██╔══██║██╔══██║██╔══██╗██║░░░██║░░░░░╚██╔╝░░").darkgreen}",
      "#{Rainbow(" ╚█████╔╝██║░░██║██║░░██║██║░░██║██║░░░██║░░░░░░██║░░░").orange}",
      "#{Rainbow(" ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░╚═╝░░░░░░╚═╝░░░").firebrick}",
      " ",
      " ",
      "#{Rainbow("░█████╗░██╗░░██╗░█████╗░██╗░░░░░██╗░░░░░███████╗███╗░░██╗░██████╗░███████╗").orange}",
      "#{Rainbow("██╔══██╗██║░░██║██╔══██╗██║░░░░░██║░░░░░██╔════╝████╗░██║██╔════╝░██╔════╝").orange}",
      "#{Rainbow("██║░░╚═╝███████║███████║██║░░░░░██║░░░░░█████╗░░██╔██╗██║██║░░██╗░█████╗░░").darkgreen}",
      "#{Rainbow("██║░░██╗██╔══██║██╔══██║██║░░░░░██║░░░░░██╔══╝░░██║╚████║██║░░╚██╗██╔══╝░░").darkgreen}",
      "#{Rainbow("╚█████╔╝██║░░██║██║░░██║███████╗███████╗███████╗██║░╚███║╚██████╔╝███████╗").orange}",
      "#{Rainbow("░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚══╝░╚═════╝░╚══════╝").firebrick}",
      "\n\n"
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

  def close_title 

    display_array = @title

    38.times do 

      y_coordinate = 2

        display_array.each do |iteration|
          y_coordinate += 1
          position_cursor_for_centering(iteration, y_coordinate)
          puts iteration
        end

      sleep 0.025
      
      temp_ascii_lines = display_array
      display_array = []

      system("clear") || system("cls")

      temp_ascii_lines.each do|iteration|

        temp_chars_array = iteration.chars

        if temp_chars_array.length > 15

          temp_chars_array[-6] = ""
          temp_chars_array[11] = ""

          display_array << temp_chars_array.join()

        else 
          display_array << temp_chars_array.join()

        end

      end

    end
    
  end

end

