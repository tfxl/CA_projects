require 'rainbow'
require 'tty-prompt'


prompt = TTY::Prompt.new

nested_bird = Rainbow("tweet,tweet").darkgreen


x = "a____#{Rainbow("He").firebrick}l#{Rainbow("lo").firebrick}_____"   # coloured data to be interpolated
y = "b____#{Rainbow("He#{nested_bird}llo").firebrick}_____"   # coloured data to be interpolated and underscore the rest

my_array = [x,y]

my_array.each do |iteration|
    puts "Start Iteration"
    if iteration.include?("#{nested_bird}")
        puts iteration
    end
end

user_choice = prompt.select('Choose the place', [x, y])