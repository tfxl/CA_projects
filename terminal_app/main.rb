require_relative 'classes/title'
require_relative 'classes/dot'
require_relative 'classes/charity_chest'
require 'rainbow'
require 'tty-prompt'



puts "Welcome to the app"


country1 = Dot.new("East", "Kenya", "Sheep", "buy a sheep for a family in Kenya", 400)



# bob = Title.new
# bob.display_title()

sleep 3

puts "Hello"

require 'tty-markdown'

output = TTY::Markdown.parse_file('introduction.md')

puts output