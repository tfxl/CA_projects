
require 'test/unit' # unit test is for TDD
require_relative '../classes/charity_cause'

class CharityCausesTest < Test::Unit::TestCase 

# This is a smaller Class and a beneficiary of the FileHandler which is probably the most important, however good to still test this one

  def setup
    @charity_cause = CharityCause.new("1", "Eastern Africa", "Sudan", "Farming", "Build a Dam", "TBD", 4000, false, "" )
  end

  def test_create
    assert_not_nil(@charity_cause)
  end

  def test_charity_cost
    assert_equal(4000, @charity_cause.cost)
  end

  def test_country
    assert_equal("Sudan", @charity_cause.country)
  end

  def test_boolean_completed
    assert_equal(false, @charity_cause.completed)
  end

end

