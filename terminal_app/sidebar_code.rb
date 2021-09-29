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




value = "RRRABCDEFG"

temp_array = value.chars()

x = temp_array.index("A")

temp_array[x] = Rainbow("CHANGE!!").orange


newby = temp_array.join("")
# temp_array = temp_array.join("")

puts temp_array

puts newby

