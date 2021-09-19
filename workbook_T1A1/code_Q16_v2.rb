
class Score_card
  attr_reader :score_template
  attr_writer
  attr_accessor :available_skill_points

  def initialize

    @score_template = [
      { name: 'Python', score: 1, selected: '[ ]' },
      { name: 'Ruby', score: 2, selected: '[ ]' },
      { name: 'Bash', score: 4, selected: '[ ]' },
      { name: 'Git', score: 8, selected: '[ ]' },
      { name: 'HTML', score: 16, selected: '[ ]' },
      { name: 'TDD', score: 32, selected: '[ ]' },
      { name: 'CSS', score: 64, selected: '[ ]' },
      { name: 'JavaScript', score: 128, selected: '[ ]' }
    ]
    @existing_skill_score = 0
    @available_skill_points = 0

    @existing_skillset = []
    @options_chosen = []

    @available_upskills = [
      { name: 'Python', score: 1, selected: '[ ]' },
      { name: 'Ruby', score: 2, selected: '[ ]' },
      { name: 'Bash', score: 4, selected: '[ ]' },
      { name: 'Git', score: 8, selected: '[ ]' },
      { name: 'HTML', score: 16, selected: '[ ]' },
      { name: 'TDD', score: 32, selected: '[ ]' },
      { name: 'CSS', score: 64, selected: '[ ]' },
      { name: 'JavaScript', score: 128, selected: '[ ]' }
    ]
  end

  def initial_check
    puts "\nHere is a list of relevant programming languages that ACME Corporation are interested in\n\n"
    display_score_template()

    adequate_answer = false
    while !adequate_answer

      puts "\nAre you competent in any of these languages? Please enter Y or N"
      initial_answer = gets.chomp.downcase # the downcase is to cater for either upper or lowercase entries

      if initial_answer == 'y'
        adequate_answer = true
        all_done = false
        competency_check()

      elsif initial_answer == 'n'
        adequate_answer = true

      else
        nope_msg()
        puts 'Please enter only Y or N'

      end
    end
  end


  def competency_check 
    puts "\nGreat! Which of the languages are you competent in ?\n\n"
    # display_score_template(score_template)

    while all_done == false

      display_score_template()
      puts "\nPlease select a number of the language you are competent in, and press enter. Enter X to exit."
      input = gets.chomp

      if input.downcase == 'x'
        all_done = true
        # iterate through existing skills. If part of the available upskill list, remove these items (as already has them)

        @existing_skillset.each do |iteration|
          @available_upskills.delete(iteration) if @available_upskills.include?(iteration)
        end
        # puts "\nThank you for your input. Under ACME Corporation guidelines your languages skill score is #{calc_existing_skill_score(existing_skillset)}"
        # upskill_points_assessment(available_upskills)

      elsif (input.to_i < 1) || (input.to_i > @score_template.length) # chose this option rather than "8" in case of future adjustment
        system 'clear'
        puts "\n\n*** Please only choose a number between 1 and #{@score_template.length} ***\n\n"

      elsif @options_chosen.include?(input.to_i)
        system 'clear'
        puts "\n\n*** You have already chosen this option !! Pick another option or enter X to exit ***\n\n"

      else
        system 'clear'
        @score_template[(input.to_i - 1)][:selected] = '[x]' # checkmarks the score_template for display
        @options_chosen.append(input.to_i) # keeps a list of options chosen, so duplicates are not an issue
        @existing_skillset.append(score_template[(input.to_i - 1)]) # existing skillset list is appended by choices
      end
    end
  end















  def display_score_template
    @score_template.each_with_index do |language, index|
      puts "#{language[:selected]} #{index + 1}. #{language[:name]}"
    end
  end

  def calc_existing_skill_score
    @existing_skillset.each do |iteration|
      @existing_skill_score += iteration[:score].to_i
    end
    return @existing_skill_score
  end

  def calc_upskill_scores
    @available_upskills.each do |language|
      @available_skill_points += language[:score].to_i
    end
    return @available_skill_points
  end

  def upskill_points_assessment()
    puts "If you wanted to upskill, you could consider studying these languages :\n\n"
    puts '=== LANGUAGES'.ljust(23) + 'SKILL SCORE POINTS', '-' * 42


    @available_upskills.each do |language|
      puts "=== #{language[:name]}".ljust(30, '_') + (language[:score]).to_s.rjust(3, '_')
    end

    puts ('-' * 6).rjust(34), @available_skill_points.to_s.rjust(33)
    puts "\n",
        "If you learnt all of the above languages you\ncould increase your skill score by #{calc_upskill_scores()} points !"
    puts "\n\n"
  end

  def nope_msg
    system 'clear'
    puts "\n"
    puts '|\  |  |^^^|  |^^^|  |^^^'
    puts '| \ |  |   |  |___|  |---'
    puts '|  \|  |___|  |      |___'
    puts "\n\n"
  end



 







  def issue_results
    system 'clear'
    puts "\nThank you for your input. Under ACME Corporation guidelines your languages skill score is #{@existing_skill_score}"
    upskill_points_assessment()
  end



  def issue_score_card
    initial_check()
    issue_results()

  end



end
############################# CODE CODE CODE ############################

var = Score_card.new
var.issue_score_card


