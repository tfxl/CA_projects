require_relative 'classes/dot'
require_relative 'classes/charity_chest'
require 'rainbow'
require 'tty-prompt'

edp = example_dot_presentation = "\u2b24"

edpr = Rainbow(edp).red
edpo = Rainbow(edp).orange
edpg = Rainbow(edp).green

puts edpr, edpo, edpg

prompt = TTY::Prompt.new

my_dot = Dot.new('West', 'Uganda', 'Cause', 'Buy a sheep', 400)

a = "    #{Rainbow('▓▓▒▒▒▒▒').gray}▒▒▒▓▓░░▒▒▒▒▒▒░░▒▒░░▒▒▒#{edpg}▒#{Rainbow('▒▒▒▒▒▒░░▒▒░░░░▒▒░░▒▒░░▒▒▒▒░░  ░░▒▒░░').gray}"
b = '    ░░▒▒░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░▓▓▓▓▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒'
c = '    ▒▒░░░░▒▒░░▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░▒▒▒▒░░░░▒▒▒▒░░░░▒▒  ░░▒▒▓▓▒▒░░▒▒░░▒▒▒▒░░  ▒▒▓▓'

# choices = [{"#{Rainbow(a.gray}#{Rainbow("o").blue} _ _ _ _ _ _ _ _ _": my_dot},
#             {"_ _ _ _ _ o _ _ _ _ _ _ _": 2}]  # each value is an object or hash of the object details.

choices = [a, b, c]

# y1 = "_ _ _ _ _ _ _ _ o _ _ _ _ _ _ _ _ _"
# y2 = "_ _ _ _ _ o _ _ _ _ _ _ _"
# y3 = "_ _ _ _ _ _ _ _ _ _"

# choices = [{y1: 1}, {y2: 2}, {y3: 3}]  # each value is an object or hash of the object details.

x = prompt.select('Choose the place', choices)

puts x
