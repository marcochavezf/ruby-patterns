#!/usr/bin/env ruby
# Lab 6: Adapter Pattern
# Date: 29-Feb-2012
# Author: 
# Marco Chávez
class QueueAdapter < SimpleQueue
  
  def initialize(q)
    @info = q
  end
  
  def pop
    if @info.empty?
      nil
    else
      @info.remove
    end
  end
  
  def push(x)
    stack = SimpleQueue.new
    while !@info.empty?
      stack.insert(@info.remove)
    end
    
    @info.insert(x)
    while !stack.empty?
      @info.insert(stack.remove)
    end
    
    self
  end
  
  def peek
    e = pop
    if e != nil
      push(e)
    end
    e
  end
  
  def empty?
    @info.empty?
  end
  
end
