start_time = Time.new

prime_numbers = [2]
# as this problem requests values 0-100, we can start our array of prime numbers with 2, the first prime number. This avoids an early conditional statement.
# if the range was more diverse, further conditions would be required, or potentially the ability to input, or the creation of a method with parameters to set the range.

investigated_number = 3
# as per above, given the range parameters, our investigation starts at number 3, as 2 already recorded in array

possible_factor = 2
# the first possible factor to investigate is 2 (even numbers)

while investigated_number < 1001

  if investigated_number % possible_factor == 0
    possible_factor = 2
    investigated_number += 1
    next
  elsif possible_factor > (investigated_number / possible_factor)
    prime_numbers.append(investigated_number)
    possible_factor = 2
    investigated_number += 1
    next
  else possible_factor += 1
  end
end

p prime_numbers

puts '-' * 35, "Time to complete process #{Time.now - start_time}", '-' * 35
