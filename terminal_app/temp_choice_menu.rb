require_relative './classes/dot'
# require_relative 'classes/charity_chest'
require 'rainbow'
require 'tty-prompt'

edp = example_dot_presentation = "\u2b24"

edpr = Rainbow(edp).red
edpo = Rainbow(edp).orange
edpg = Rainbow(edp).green

puts edpr, edpo, edpg

prompt = TTY::Prompt.new

my_dot = Dot.new('West', 'Uganda', 'Cause', 'Buy a sheep', 400, "A")
my_dot2 = Dot.new('West', 'Uganda', 'Cause', 'Buy a goat', 400, "B")
my_dot3 = Dot.new('West', 'Uganda', 'Cause', 'Buy a sheep', 400, "C")

my_dot = Dot.new('West', 'Uganda', 'Cause', 'Buy a sheep', 400, "    #{Rainbow('▓▓▒▒▒▒▒').gray}▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{edpg}▒#{Rainbow('▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░').gray}")
my_dot2 = Dot.new('West', 'Uganda', 'Cause', 'Buy a goat', 400, '    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒')
my_dot3 = Dot.new('West', 'Uganda', 'Cause', 'Buy a kangaroo', 400, '    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓')


dot_array = [my_dot, my_dot2, my_dot3]
dot_array_presentations = [my_dot.presentation, my_dot2.presentation, my_dot3.presentation]

choices = dot_array_presentations

user_choice = prompt.select('Choose the place', choices)

dot_array.each_with_index do |value, index|
   
    if value.presentation == user_choice
        puts value.description
    end
end