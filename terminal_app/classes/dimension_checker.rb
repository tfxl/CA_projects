require 'tty-screen'
require 'rainbow'

class DimensionChecker

  attr_reader :height, :width

  def initialize

    @terminal_screen_size = TTY::Screen.size
    @height = @terminal_screen_size[0]
    @width = @terminal_screen_size[1]

    @minimum_height = 45
    @minimum_width = 125

  end

  def check_height

    if @height < @minimum_height
      puts Rainbow("Current Height of Terminal Window is #{@height}\n").red
      puts Rainbow("PLEASE SET MINIMUM HEIGHT OF TERMINAL WINDOW TO #{@minimum_height} ROWS & RESTART PROGRAM!!!!!! THANK YOU\n\n").red
      return false

    else 
      # puts Rainbow("Current width of Terminal Window is #{@height}\n").red
      return true

    end
  end


  def check_width

    if @width < @minimum_width
      puts Rainbow("Current width of Terminal Window is #{@width}\n").red
      puts Rainbow("PLEASE SET MINIMUM WIDTH OF TERMINAL WINDOW TO #{@minimum_height} COLUMNS & RESTART PROGRAM!!! THANK YOU\n\n").red
      return false

    else 
      # puts Rainbow("Current width of Terminal Window is #{@width}\n").red
      return true

    end
  end
  

  def ensure_dimensions

    adequate_window_dimensions = false

    while !adequate_window_dimensions

      adequate_window_dimensions = check_height() && check_width()
      sleep 2

    end
  end

end

