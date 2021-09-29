require_relative './classes/dot'
# require_relative 'classes/charity_chest'
require 'rainbow'
require 'tty-prompt'
require 'json'







# cursor.pos = [0,0]      # home
# cursor.pos = {x:0,y:0}  # home
# x = cursor.pos          # save current position
# sleep(1)
# cursor.pos += {x:5}     # move 5 to the right
# cursor.pos += {x:-5}    # move 5 to the left
# cursor.pos = x          # restore position


charity_coins = 100
budget_dollars = 500

username = "Mango"

all_da_data = [[],{},{}]

updated_good_causes = [{:hello => 2, :cool_cats => "miow"}, {:mongoose => 4}]

updated_good_causes.each do |object|
    all_da_data[0] << object
end

all_da_data[1][:charity_coins] = charity_coins
all_da_data[1][:budget] = budget_dollars


all_da_data[2][:username] = username

p all_da_data


File.write('sidebar_data.json', JSON.pretty_generate(all_da_data))