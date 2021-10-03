
require 'test/unit' # unit test is for TDD
require 'rainbow'
require_relative '../classes/charity_chest'

class CharityChestTest < Test::Unit::TestCase 

# This is the second most important class, and it needs to be able to modify so the program can operate.

  def setup
    @charity_chest = CharityChest.new(1000, 500)
  end

  def test_create
    assert_not_nil(@charity_chest)
  end

  def test_charity_coins
    assert_equal(1000, @charity_chest.coins)
  end

  def test_budget
    assert_equal(500, @charity_chest.budget)
  end

  def test_increase_coins
    @charity_chest.increase_coins(2000)
    assert_equal(3000, @charity_chest.coins)
  end

  def test_decrease_coins
    @charity_chest.decrease_coins(100)
    assert_equal(900, @charity_chest.coins)
  end

end

