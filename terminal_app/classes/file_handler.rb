require 'json'
require 'tty-prompt'
require 'rainbow'

require_relative './charity_cause'
# require_relative './charity_chest'


class FileHandler

  attr_reader :username, :prompt
  attr_accessor :good_causes_array, :charity_coins, :budget

  def initialize

    @parsed_data = {}

    ####### DATA TO BE UPLOADED AFTER SUCCESSFUL PARSING OF FILE ################
    @good_causes_array = []
    @budget = nil 
    @charity_coins = nil 
    @username = nil 

    ########## @prompt CREATED HERE TO USE THE INSTANCE ATTRIBUTE IN ALL CLASS METHODS #########
    @prompt = TTY::Prompt.new # instance to use through file

  end

################ RUN (FUN? ANNOYING? JUST FUN FOR ME?) ERROR MESSAGE AND EXIT PROGRAM ##########################

  def error_message_and_leave(e)
    # consider a loading bar or spinner here

    sleep 1
    puts "\nOk so in technical terms, this is the issue :\n\n"

    error_msg = e.to_s.chars

    error_msg.each do |i|
      print Rainbow(i).red
      sleep 0.05
    end

    puts "\n\n"

    final_message = 'So...... Anyways....... Please restart program and try creating a new profile '.chars
    final_message.each_with_index do |character, index|
      sleep 0.8 if (index == 8) || (index == 23) || (index == final_message.length - 1)
      sleep 0.04
      print Rainbow(character).yellow
    end

    exit #exit the program if issues with reading file 

  end


  #################################### OPEN AND PARSE JSON FILE ####################

  def parse_json_file(file_path_as_string)

    begin

    @parsed_data = JSON.load_file(file_path_as_string, symbolize_names: true)

    rescue Errno::ENOENT => e
      puts Rainbow("\n\nWell now.... file appears to be missing..... I wonder where it went ?").yellow
      sleep 1
      error_message_and_leave(e)

    rescue Errno::EACCES => e
      puts Rainbow("\n\nSo you haven't got permission for this file.... Dunno why.... Guess you're not at Level 8 Clearance..").yellow
      sleep 1
      error_message_and_leave(e)

    rescue StandardError => e
      puts Rainbow("\n\nAwkies.... the file is not loading.... probably a user error :) ").yellow
      sleep 1
      error_message_and_leave(e)

    end

  end


  #################################### LOAD NEW FILE FROM JSON DEFAULT ####################

  def upload_data_from_file

    # display elephant ascii ??

    system("clear") || system("cls")

    load_options =
      [
        'Create New',
        'Load Last Save'
      ]

    user_choice = @prompt.select('Please select one of the options', load_options)

    case user_choice

    when load_options[0]
      create_new_file() # which will also run a function to upload the data

    when load_options[1]
      load_saved_file() # which will also run a function to upload the data

    end

  end

#################################### LOAD NEW FILE FROM JSON DEFAULT ####################

  def create_new_file
    puts "CREATE NEW FILE"
    # user has chosen to load a new file, but first it will see if any saved file exists

    begin
     # this checks if there is already a profile, and will ask for further options if there is
      JSON.load_file('./data/user_data.json', symbolize_names: true)

      confirm =
        [
          "That's fine, start a new profile",
          'Actually, let me choose again'
        ]

      confirmation = @prompt.select('Choosing New means if you save your file, it will overwrite the old one!', confirm)

      case confirmation
        
      when confirm[0]
        raise # will thus intentially fail the parsing from user_data and create new file

      when confirm[1]
        upload_data_from_file() # if user wants to choose again, then will run that method again
      end

    rescue # if there is no file user_data to run through, will rescut to here

      parse_json_file('./data/default_data.json')
      # will parse the data and run a method to upload (attribute) the data in manageable format
      attribute_data_from_parsed_file()

    end

  end


  #################################### LOAD SAVED FILE FROM JSON DEFAULT ####################

  def load_saved_file

    begin
      parse_json_file('./data/user_data.json')

      puts "Great to have you back #{@parsed_data[:userdata][:username]}!"
      attribute_data_from_parsed_file()

      @prompt.keypress(Rainbow('Please press space or enter to continue!').orange.to_s, keys: %i[space return])

    rescue
      puts "It appears that no previous file exists. Sorry... it just doesn't...."

      @prompt.keypress(Rainbow('Please press space or enter to return!').orange.to_s,keys: %i[space return])

      upload_data_from_file()

    end

  end 

  ########################### ATTRIBUTE / UPLOAD FILE DATA #####################################

  def attribute_data_from_parsed_file

    @username = @parsed_data[:userdata][:username]
    @charity_coins = (@parsed_data[:userdata][:charity_coins]).to_i
    @budget = (@parsed_data[:userdata][:budget]).to_i

    #this create and push all the charity_causes into the good_causes_array
    @parsed_data[:charity_causes].each do |charity_causes_hash| 
      @good_causes_array << CharityCause.new(
        charity_causes_hash[:id], 
        charity_causes_hash[:area], 
        charity_causes_hash[:country], 
        charity_causes_hash[:category], 
        charity_causes_hash[:description],
        charity_causes_hash[:charity_name], 
        charity_causes_hash[:cost].to_i, 
        charity_causes_hash[:completed],
        charity_causes_hash[:presentation])
    end

  end

  ########################### SAVE PROGRESS / SAVE DATA TO JSON ################################

  def save_file(updated_good_causes, charity_coins, budget_dollars, username)
    # updated_good_causes is an array of objects
    # the others are all single values

    all_data_hash = 
    {
      charity_causes: updated_good_causes.map { |cause| cause.to_json_format }, # this will iterate and add to hash as value to key charity_causes:
      userdata: {
        username: username,
        budget: budget_dollars.to_i,
        charity_coins: charity_coins.to_i
      }
    }

    File.write('./data/user_data.json', JSON.pretty_generate(all_data_hash))

  end


  ########################### ITERATE AND SEE ALL THE DATA ################################

  def iterate_my_data # this can form the basis of formal testing for this whole class

    puts "\n#{"*"*40}"
    puts "GOOD CAUSES ARRAY DATA"
    puts "
    Username : #{@username}
    Budget : #{@budget}
    Charity Coins  #{@charity_coins}
    "

    puts "\n#{"*"*40}"
    puts "GOOD CAUSES ARRAY DATA"
    @good_causes_array.each do |iteration|
      puts iteration.id
      puts iteration.area
      puts iteration.country
      puts iteration.category
      puts iteration.description
      puts iteration.charity_name
      puts iteration.completed
      puts iteration.presentation
    end

    puts "\n#{"*"*40}"

  end


########################### END OF CLASS ################################


end


########## QUICK TESTING AREA ############# (to be formalised)

# test_file = FileHandler.new
# test_file.upload_data_from_file

# test_file.iterate_my_data


