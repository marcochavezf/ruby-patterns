# File: simple_queue.rb
#!/usr/bin/env ruby
# Lab 6: Adapter Pattern
# Date: 29-Feb-2012
# Author:
# Marco Chávez

class SimpleQueue
  
  def initialize
    @info =[]
  end
  
  def insert(x)
    @info.push(x)
    self
  end
  
  def remove
    if empty?
      raise "Can't remove if queue is empty"
    else
      @info.shift
    end
  end
  
  def empty?
    @info.empty?
  end
  
  def size
    @info.size
  end
  
  def inspect
    @info.inspect
  end
end
