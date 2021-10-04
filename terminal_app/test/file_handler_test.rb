
require 'test/unit' # unit test is for TDD
require 'rainbow'
require_relative '../classes/file_handler'

class FileHandlerTest < Test::Unit::TestCase 

# This is the most important class, making sure data can be uploaded to the program, and all data is reedy for use

  def setup
    @file_handler = FileHandler.new
    @file_handler.parse_json_file("../data/default_data.json")
    @file_handler.attribute_data_from_parsed_file   
  end

  def test_create
    assert_not_nil(@file_handler)
  end

  def test_username
    assert_equal("__default__", @file_handler.username)
  end

  def test_charity_coins
    assert_equal(2500, @file_handler.charity_coins)
  end

  def test_budget
    assert_equal(300, @file_handler.budget)
  end

  ### CHARITABLE CAUSES DATA

  def test_good_causes_array_uploads
    assert_not_nil(@file_handler.good_causes_array)
  end

  # This test ensures that all 30 of the causes are indeed put into the new array
  def test_all_causes_uploaded
    assert_equal(30, @file_handler.good_causes_array.length)
  end

  def test_country_data_extractable
    assert_equal("Tunisia", @file_handler.good_causes_array[0].country)
  end

  def test_boolean_data_extractable
    assert_equal(false, @file_handler.good_causes_array[0].completed)
  end

  def test_presentation_empty_by_default
    assert_equal("", @file_handler.good_causes_array[0].presentation)
  end


end

