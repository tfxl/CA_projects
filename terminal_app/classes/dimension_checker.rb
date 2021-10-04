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

    @exit_time = 15
    @plural = "S"

  end

  def check_height

    if @height < @minimum_height
      puts Rainbow("Current Height of Terminal Window is #{@height}\n").red
      puts Rainbow("PLEASE SET MINIMUM HEIGHT OF TERMINAL WINDOW TO #{@minimum_height} ROWS !! THANK YOU\n\n").red
      return false

    else 
      # puts Rainbow("Current width of Terminal Window is #{@height}\n").red
      return true

    end
  end


  def check_width

    if @width < @minimum_width
      puts Rainbow("Current width of Terminal Window is #{@width}\n").red
      puts Rainbow("PLEASE SET MINIMUM WIDTH OF TERMINAL WINDOW TO #{@minimum_width} COLUMNS !! THANK YOU\n\n").red
      return false

    else 
      # puts Rainbow("Current width of Terminal Window is #{@width}\n").red
      return true

    end
  end

  def timer
    sleep 1
    @exit_time -= 1
    case @exit_time
    when 1
      @plural = ""
    when 0
      @plural = "S"
    when -1
      exit
    end
  end
  

  def ensure_dimensions # this has a check built in but 

    system("clear") || system("cls")
    adequate_window_dimensions = false

    while !adequate_window_dimensions
      system("clear") || system("cls")

      @terminal_screen_size = TTY::Screen.size
      @height = @terminal_screen_size[0]
      @width = @terminal_screen_size[1]
      adequate_window_dimensions = check_height() && check_width()

      puts Rainbow("IF YOU DO NOT COMPLETE THE ADJUSTMENTS, PROGRAM WILL EXIT IN #{Rainbow("#{@exit_time} SECOND#{@plural}").orange}\n\n").red
    
      timer()

    end
  end

end

