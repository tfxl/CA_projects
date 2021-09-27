# TTY gems have a single purpose, minimal API and composable
# Standard input results in standard output

require 'tty-prompt'
require 'rainbow'

#requires instantiation first
prompt = TTY::Prompt.new           # so new Prompt, from the TTY Gem (or parent class ? *review this)

prompt.ask('What is your name?', default: ENV['USER']) #default searches computer it appears ? 

#this is good for checking a single characteristic. 

prompt.ask("What price per coin?") do |q|
    q.required(true, 'You need to provide a price')
    q.validate(/[\d.]+/, 'Invalid entry')  # using a REGEX to check for number entry
    q.convert -> (p) {p.to_f}  # this function passes to (p) and from there p can be converted to float
end


######### MASKED PROMPT  ############

heart = prompt.decorate('Hrt', :magenta) #somehow used a heart (?) Hexcode ?

result = prompt.mask('What is your secret?', mask: heart) do |q|
    q.validate(/[a-z\ ]{5,15}/)   # this regex means it will only allow an entry only above 5 characters. Accepts above 15 too.
end

puts "Secret: \"#{result}\""    #is this an old style of interpolation ?

# What this does is askes the question (What is your secret? )
# then when the user types, a heart appears (or in this case a "Hrt" appears) instead of the characters being typed
# once enter is selected, then the Secret: "Actual message typed"  appears (it was masked before)
# so simlar to a password being entered, with dots, and then can reveal later




############### MULTI CHOICE  ###############

beer = "hi"

drinks = %w(vodka Rainbow(______beer).blue wine)  # normal spacing doesn't have an affect. But what if variable used with ____ ? Nope
# does not appear to accept variables. The underscore works, the Rainbow does not.

prompt.multi_select('Choose your favourite drink', drinks, help: '(Use arrow keys, press enter to select, space for multi)')

# this creates a standard menu but it will allow keys to move up and down to choose from list

# on the example, was able to choose multiple options, using the SPACE key
# the help menu comes up in dark blue, like the default option in prompt, giveing a suggested of actions


################## PROMPT EVENTS !! #############  This doesn't appear to work in terminal without other supporting code ?

prompt.on(:keypress) do |event|
    if event.value == 'b'
        puts "you pressed b which will activate key up"
        prompt.trigger(:keyup)
    end
    if event.value == 'k'
        puts "you pressed k which will activate key down"
        prompt.trigger(:keydown)
   
    end
end

####################### COLLECT PROMPT ######

# prompt.collect do
#     key(:name).ask('Name?')
#     key(:age).ask('Age?', convert: :int)

#     key(:address) do  # this will build another hash, nesting it within the first
#         key(:street).ask('Street?', required: true)
#         key(:zipcode).ask("Zipcode?", validate: /\A\d{3}\Z/)   #accepts three numbers, no letters
#     end
# end

# this can return a nested hash (looks like json)


############## TTY CONFIG ############



####### PROGRESS BAR #############

# require 'pastel'    # this might be useful for partially completed causes
# require 'tty-progressbar'

# pastel = Pastel.new 

# green = pastel.on_green(" ")               # NOTE SOME CONFLICTS WITH PASTEL VERSION ?
# red = pastel.on_red(" ")

# bar = TTY::ProgressBar.new(
#     ":bar :percent :elapsed",    # can customise ?
#     total: 30,
#     complete: green,
#     incomplete: red,
#     hide_cursor: true
# )
# #then call this, now it is constructed:

# 30.times do        #so it actually makes a progress bar to tick across here. Also have mutliple bars option. (24min)
#     sleep(0.1)
#     bar.advance     
# end

# could use threads and these can run at same time.


######### SPINNER  ##################





########### TTY MARKDOWN ##################### Could be good for an instruction menu

# this can incorporate a markdown file into the display ! In a readable format.

require 'tty-markdown'

output = TTY::Markdown.parse_file('tty_prompt.md')

puts output


############ COINPARE ###############

# a combination of the functions to allow a table of currency comparisons and portfolio mockup








