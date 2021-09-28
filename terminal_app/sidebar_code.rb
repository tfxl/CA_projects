require_relative './classes/dot'
# require_relative 'classes/charity_chest'
require 'rainbow'
require 'tty-prompt'







# cursor.pos = [0,0]      # home
# cursor.pos = {x:0,y:0}  # home
# x = cursor.pos          # save current position
# sleep(1)
# cursor.pos += {x:5}     # move 5 to the right
# cursor.pos += {x:-5}    # move 5 to the left
# cursor.pos = x          # restore position


x = 500
if x/1000 >= 1
    y = "case1"
elsif x/100 >= 1
    y = "case2"
elsif x/10 >= 1
    y = "case3"
elsif x/1 >= 1
    y = "case4"
end

puts y

z = x/1000
puts z

x = 500
case x
