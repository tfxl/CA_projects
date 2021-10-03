require 'rainbow'

class CharityCause
  attr_reader :id, :area, :country, :category, :description, :charity_name, :cost
  attr_accessor :completed, :presentation

  def initialize(id, area, country, category, description, charity_name, cost, completed, _presentation)
    @id = id
    @area = area
    @country = country
    @category = category
    @description = description
    @charity_name = charity_name
    @cost = cost
    @completed = completed
    @presentation = ''
  end

  # Returns {}
  def to_json_format
    {
      id: @id,
      area: @area,
      country: @country,
      category: @category,
      description: @description,
      charity_name: @charity_name,
      cost: @cost,
      completed: @completed,
      presentation: @presentation
    }
  end

end
