class Consumables

  attr_reader
  attr_writer
  attr_accessor

  @@consumables_sold = []

  def self.number_items_sold
    @@consumables_sold.length
  end

  def self.profit
    @@consumables_sold.sell_cost - @@consumables_sold.buy_cost 
  end

  def initialize(buy_cost, sell_cost, size) #size will have default reference sizes of S, M, L
    @buy_cost = buy_cost
    @sell_cost = sell_cost
    @size = size
  end
end


class Food < Consumables

  def initialize(is_gluten)
    super(buy_cost, sell_cost, size)
    
    @description = food_type #this changes from customer order to Burger | Chips | Pizza
    @is_gluten = is_gluten

  end

end

class Pizza < Food

  def initialize(topping_type)
    super(is_gluten) # can this get the parent class, or should the burger go directly under consumables

    @topping_type = topping_type

  end
end

class Drink < Consumables 

  def initialize()
    super(buy_cost, sell_cost, size)

  end

end


class Packaging < Consumables

  def initialize(description)  #this links to an array, or dictionary, with pre-defined terms
    super(buy_cost, sell_cost, size)

    @description = description
    
  end

end