#!/usr/bin/env ruby
require 'forwardable'

class Beverage
  attr_reader :description, :cost
end

class DarkRoast < Beverage
  def initialize
    @description = "Dark Roast Coffee"
    @cost = 0.99
  end
end

class Espresso < Beverage
  def initialize
    @description = "Espresso"
    @cost = 1.99
  end
end

class HouseBlend < Beverage
  def initialize
    @description = "House Blend Coffee"
    @cost = 0.89
  end
end

class CondimentDecorator < Beverage
  extend Forwardable
  def_delegators :@beverage
  
  def initialize(beverage)
    @beverage = beverage
  end
end

class Mocha < CondimentDecorator
  def description
    @beverage.description + ", Mocha"
  end
  def cost
    @beverage.cost + 0.20 
  end
end

class Whip < CondimentDecorator
  def description
    @beverage.description + ", Whip"
  end
  def cost
    @beverage.cost + 0.10 
  end
end

class Soy < CondimentDecorator
  def description
    @beverage.description + ", Soy"
  end
  def cost
    @beverage.cost + 0.15
  end
end

class Milk < CondimentDecorator
  def description
    @beverage.description + ", Milk"
  end
  def cost
    @beverage.cost + 0.10 
  end
end