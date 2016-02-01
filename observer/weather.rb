#!/usr/bin/env ruby
# Lab 3: Observer Pattern
# Date: 08-Feb-2012
# Author:
# Marco Chávez
# File: weather.rb

require "observer"

class WeatherData
  include Observable

  def set_measurements (temperature, humidity, pressure)
    changed
    notify_observers(temperature, humidity, pressure)
  end
end

class CurrentConditionsDisplay
  def update(temperature, humidity, pressure)
    print "Current conditions: %.1fF degrees and %.1f%% humidity\n" % [temperature, humidity]
  end
end

class StatisticsDisplay
  def initialize
    super
    @min = 0
    @max = 0
  end
  
  def update(temperature, humidity, pressure)
    
    if @max == 0 && @min ==0
      @max = temperature
      @min = temperature
    end    
    
    if temperature > @max
      @max = temperature
    end
    
    if temperature < @min
      @min = temperature
    end
    
    print "Avg/Max/Min temperature = %.1f/%.1f/%.1f\n" % [(@max+@min)/2,@max, @min]
  end
end

class ForecastDisplay
  
  def initialize
    super
    @prev_pressure = 0
  end
  
  def update(temperature, humidity, pressure)
    
    print "Forecast: "
    if pressure > @prev_pressure
      print "Improving weather on the way!\n"
    elsif pressure < @prev_pressure
      print "Watch out for cooler, rainy weather\n"
    else
      print "More of the same\n"
    end
    @prev_pressure = pressure
    
  end
end
  