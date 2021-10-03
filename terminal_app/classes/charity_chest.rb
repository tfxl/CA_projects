require 'tty-prompt'

require_relative './ascii_art'

class CharityChest

  attr_reader :more_coins_options, :charity_chest_menu_choice
  attr_writer :group_sponsors_available
  attr_accessor :coins, :budget

  def initialize(starting_coins, starting_budget)
    @budget = starting_budget
    @coins = starting_coins

    @prompt = TTY::Prompt.new

    @ascii_art = AsciiArt.new
    @coin_display = nil # does not want to hold a hash

    @charity_chest_menu_choice = nil
    @more_coins_options = [
      Rainbow('Would you like to buy more Charity Coins ?').darkolivegreen,
      Rainbow('Would you like to earn some more money ?').lightgray, 
      Rainbow('How about asking for a group contribution?').darkolivegreen,
      Rainbow('Return to Main Menu').darkolivegreen
    ]

    @group_sponsors_available = false

  end

  def increase_coins(amount)
    if @coins + amount >= 10_000
      puts '$9,995 is the current maximum that fits into the chest!!'
      @coins = 9995

    else
      @coins += amount
    end
  end

  def decrease_coins(amount)
    @coins -= amount
  end

  def buy_charity_coins
    puts "How much would you like to spend from your budget ? #{Rainbow('$10 for 100 Charity Coins').blue}"
    debit = @prompt.slider('$ amount', max: @budget, step: 10, default: 0,
                                       format: "|:slider| %d $ will be spent. #{Rainbow("You have $#{@budget} remaining in your budget").red}")
    @budget -= debit
    increase_coins(debit * 10)
    display_chest
    puts "Thank you for your generosity. You now have an extra #{debit * 10} Charity Coins"
  end

  def display_chest
    system("clear") || system("cls")

    ref_array_1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    ref_array_2 = [
      @ascii_art.zero,
      @ascii_art.one,
      @ascii_art.two,
      @ascii_art.three,
      @ascii_art.four,
      @ascii_art.five,
      @ascii_art.six,
      @ascii_art.seven,
      @ascii_art.eight,
      @ascii_art.nine
    ]

    temp_array = @coins.to_s.chars.map(&:to_i) # eg [8, 7, 6, 4] in temp array

    temp_array.each_with_index do |element, index|
      reference_index = ref_array_1.index(element)
      case index
      when 0
        @ascii_art.y1 = ref_array_2[reference_index]
      when 1
        @ascii_art.y2 = ref_array_2[reference_index]
      when 2
        @ascii_art.y3 = ref_array_2[reference_index]
      when 3
        @ascii_art.y4 = ref_array_2[reference_index]
      end
    end

    length = temp_array.length()

    @ascii_art.multiplier = (length - 1)

    case length
    when 1
      @ascii_art.y2 = @ascii_art.nada
      @ascii_art.y3 = @ascii_art.nada
      @ascii_art.y4 = @ascii_art.nada
    when 2
      @ascii_art.y3 = @ascii_art.nada
      @ascii_art.y4 = @ascii_art.nada
    when 3
      @ascii_art.y4 = @ascii_art.nada
    end

    print @ascii_art.charity_coins_title

    @ascii_art.draw_charity_chest

    # print @ascii_art.charity_chest_art
    puts "Here's the financials => Budget #{@budget} and Charity Coins #{@coins}"
    puts "\n\n\n\n\n\n\n"

  end


  def charity_chest_menu  
  @charity_chest_menu_choice = @prompt.select('What would you like to do ?', @more_coins_options)

  end

  def use_bank_account
    if @budget.positive?
      buy_charity_coins()
      # charity_chest_menu()

    elsif @budget == 0
      puts "Unfortunately you have no remaining budget for this month. #{Rainbow('Thank you for your previous generosity').red}"
      @prompt.keypress("#{Rainbow('Press space or enter to return to Charity Chest').orange}", keys: %i[space return])
      # charity_chest_menu()
    end
  end

  def do_work
    puts Rainbow("\n\nFEATURE SOON TO EARN COINS\n\n").red

    # features from a list of activities, each with different time bars and different earnings 
    # random generation if 0-4 do this, if 5 - 6 do this, if 7 do this, if 8 do this, if 9 do this

    # bar = TTY::ProgressBar.new("Waiting ...[:bar]", total: 30)
    # 30.times.do
    #     sleep(0.1)
    #     bar.advance(1)
    # end


    # lighthouse: {
    #     interval: 10,
    #     frames: ["∙∙∙", "●∙∙", "∙●∙", "∙∙●", "∙∙∙"]

    #increase coins(amount)

    @prompt.keypress("#{Rainbow('Press space or enter to return to Charity Chest').orange}", keys: %i[space return])
    # charity_chest_menu()
  end


  def sponsorship_received
    @group_sponsors_available = false
    @prompt.keypress("#{Rainbow('Press space or enter to return to Charity Chest').orange}", keys: %i[space return])
    # charity_chest_menu()
  end


  def seek_group_contribution(number_completed)

    if @group_sponsors_available # this is updated only whenever milestones 5, 10, 15, 20 reached

      if number_completed.between?(5, 9)

        puts "You have shown strong initial engagement in charitable donations. Your group supports you with 1000 charity coins"
        increase_coins(1000)
        sponsorship_received()

      elsif number_completed.between?(10, 14)
        puts "You have shown strong continued engagement in charitable donations. Your group supports you with 2000 charity coins"
        increase_coins(2000)
        sponsorship_received()

      elsif number_completed.between?(15, 19)
        puts "You have shown strong continued engagement in charitable donations. Your group supports you with 2000 charity coins"
        increase_coins(3000)
        sponsorship_received()

      elsif number_completed.between?(20, 24)
        puts "You have shown strong continued engagement in charitable donations. Your group supports you with 3000 charity coins"
        increase_coins(4000)
        sponsorship_received()
      end

    else 
      puts Rainbow("Unfortunately you were unable to gain group sponsorship. Keep supporting causes and try again")
      @prompt.keypress("#{Rainbow('Press space or enter to return to Charity Chest').orange}", keys: %i[space return])
      # charity_chest_menu()

    end

  end


end
