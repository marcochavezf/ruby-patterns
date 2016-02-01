#!/usr/bin/env ruby
class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end
  def has_next?
    @index < @array.length
  end
  def item
    @array[@index]
  end
  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = ['red', 'green', 'blue']

i = Enumerator.new(array)

#begin
#  while true
#    p i.next
#  end
#rescue StopIteration
#end

fib = Enumerator.new do |yielder|
  a, b = 0, 1
  i = 1
  loop do
    yielder << a
    a, b = b, a + b
    #break if i == 10
    #i += 1
  end
end

#p fib.take_while {|x| x < 100}
#fib.each {|x| puts x}

#p fib.next
#fib.rewind
#p fib.next

class Node
  def initialize(info, left=nil, right=nil)
    @info = info
    @left = left
    @right = right
  end
  
  def inorder_generator
    Enumerator.new do |y|
      inorder(y)
    end
  end
  
  def levelorder_generator
    Enumerator.new do |y|
      levelorder(y)
    end
  end
  
  protected
  
  attr_reader :info, :left, :right
  
  def inorder(y)
    @left.inorder(y) if @left
    y << @info
    @right.inorder(y) if @right
  end
  
  def levelorder(y)
    queue = [self]
    while not queue.empty?
      current = queue.shift
      queue << current.left if current.left
      queue << current.right if current.right
      y << current.info
    end
  end
end

t = Node.new(5,
             Node.new(3,
                      Node.new(0, nil, Node.new(2)),
                      Node.new(4)),
             Node.new(7,
                      Node.new(6),
                      Node.new(10,
                               Node.new(8),
                               Node.new(12))))
#g = t.inorder_generator
g = t.levelorder_generator
#p g.next
p g.to_a

#begin
#  while true
#    p g.next
#  end
#rescue StopIteration
#end
#
#p g.max

p g.each {|x| puts x}