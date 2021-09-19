# This problem provides two variables, raining and temperature
raining = true
temperature = 0

# Any other variables in this code are not REQUIRED for the code to function, but rather improve flow control

#There are additional newline characters utilised to grand additional readability in terminal

adequate_answer = false
while adequate_answer == false

  puts 'Is it raining ? Please only enter Y or N'

  input_raining = gets.chomp.downcase
  case input_raining
  when 'y'
    raining = true
  when 'n'
    raining = false
  else
    puts "\n**** Please only enter a Y or N in answer to this question ****\n\n"
    next
  end

  puts 'What is the temperature ? Please enter a number in digit format only ? eg 10'

  input_temperature = gets.chomp
  input_temperature_dance = input_temperature.to_i.to_s
  # this sets up variables to compare with each other to see if they are numbers or not
  # gets brings in a string, .to_i method convers to integer, but also converts words to 0.0
  # which will be recognised as an integer. "Word" => 0.0 => "0.0"   BUT   "15" => 15 => "15"

  if !(input_temperature == input_temperature_dance)
    puts "*** This is not a number, or not a number in the correct format (digit) ***\n* Please enter a number in digit form only. Please retart input.*\n\n"
    next

  else
    adequate_answer = true
    input_temperature = input_temperature.to_i # back to integer. Use this one to keep readable

    if raining && (input_temperature < 15)
      print "It's wet and cold\n" # print statement requested instead of puts. Newline desired.

    elsif !raining && (input_temperature < 15)
      print "It's not raining but cold\n"

    elsif !raining && (input_temperature >= 15)
      print "It's warm but not raining\n"

    else
      puts "It's warm and raining" # no print statement requested for this section, so chose to use a puts statement.
    end
  end
end
puts "\nThank you for using this weather program"
