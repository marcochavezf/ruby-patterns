#!/usr/bin/env ruby
# Lab 7: Singleton and Decorator Patterns
# Date: 14-Mar-2012
# Author: Marco Chávez
require 'singleton'

class Tigger
  include Singleton
  
  def to_s
    return "I'm the only one!"
  end
    
  def roar
    'Grrr!'
  end    
        
end

