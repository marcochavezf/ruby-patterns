# Lab 1: Unit Testing
# Date: 18-Jan-2012
# Author:
# Marco Chávez
# File name: deque.rb

class Deque
	
  def initialize(*elements)
    @queue = elements
  end
	
  def push_back(obj)
    @queue.push(obj)
  end	
  
  def push_front(obj)
    @queue.insert(0,obj)
  end
	
  def pop_back
    @queue.pop
  end
	
  def pop_front
    @queue.delete_at(0)
  end
	
  def back
    @queue.last
  end
	
  def front
    @queue.first
  end
	
  def empty?
    @queue.empty?
  end
	
  def length
    @queue.length
  end
	
  def size
    @queue.length
  end
	
  def inspect
    "front -> #{ @queue.inspect } <- back"
  end
	
end
