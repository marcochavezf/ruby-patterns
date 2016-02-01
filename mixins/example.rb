#!/usr/bin/env ruby

class Thing
  extend Enumerables
  
  def initialize(thing1, thing2)  
    @thing1 = thing1
    @thing2 = thing2
  end
  
  def each
    yield @thing1
    yield @thing2
  end
end

t1 = Thing.new(5, 3)
puts t1.all? { |x| x.odd? }
puts t1.all? { |x| x > 4 }
p t1.collect { |x| x ** 2 }
p t1.select { |x| x > 4 }
puts t1.inject(0) { |accum, x| accum + x }
puts t1.inject(1, :*)
puts t1.mins
puts t1.max
p t1.sort

def m
  if block_given?
    yield 5
  else
    puts "No block given"
  end
end

m { |x| puts "Hello from yield #{ x } "}
