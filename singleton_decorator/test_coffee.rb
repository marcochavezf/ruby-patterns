#!/usr/bin/env ruby
# Lab 7: Singleton and Decorator Patterns
# Date: 14-Mar-2012
# Author: Marco Chávez
require 'test/unit'
require 'coffee'

class MyTest < Test::Unit::TestCase

  def test_espresso
    beverage = Espresso.new    
    assert_equal("Espresso", beverage.description)
    assert_equal(1.99, beverage.cost)
  end
  
  def test_dark_roast
    beverage = DarkRoast.new
    beverage = Milk.new(beverage)    
    beverage = Mocha.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)        
    assert_equal("Dark Roast Coffee, Milk, Mocha, Mocha, Whip", beverage.description)
    assert_equal(1.59, beverage.cost)
  end
  
  def test_house_blend
    beverage = HouseBlend.new
    beverage = Soy.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("House Blend Coffee, Soy, Mocha, Whip", beverage.description)
    assert_equal(1.34, beverage.cost)
  end
  
end