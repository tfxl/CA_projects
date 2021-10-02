require_relative './ascii_art'
require 'tty-prompt'

class CharityChest
  attr_accessor :coins, :budget

  def initialize(starting_coins, starting_budget)
    @budget = starting_budget
    @coins = starting_coins
    @ascii_art = AsciiArt.new
    @prompt = TTY::Prompt.new
    @coin_display = nil # does not want to hold a hash
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
  end

  def return_coins_count
    @charity_coins
  end

  def return_budget_remaining
    @budget
  end
end
