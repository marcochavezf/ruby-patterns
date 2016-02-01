#!/usr/bin/env ruby
# Lab 7: Singleton and Decorator Patterns
# Date: 14-Mar-2012
# Author: Marco Chávez
require 'test/unit'
require 'tigger'

class TiggerTest < Test::Unit::TestCase
  
  def test_tigger
    t = Tigger.instance
    assert_same(t, Tigger.instance)
    assert_raise(NoMethodError) do       # "new" method should be private!
      Tigger.new
    end
    assert_equal("I'm the only one!", t.to_s)
    assert_equal('Grrr!', t.roar)
  end
  
end