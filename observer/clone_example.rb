#!/usr/bin/env ruby
class Stack
  def initialize
    @info = []
  end
  def inspect
    "#{ @info } <- top"
  end
  def push(x)
    @info.push(x)
  end
  def pop
    @info.pop
  end
  def clone
    obj = Stack.new
    self.each {|x| obj.push(x)}
    obj
  end
  def each(&b)
    @info.each(&b)
  end
end

s= Stack.new
p s
s.push('a')
s.push('b')
s.push('c')
p s
p s.pop

s2 = s.clone
p s2

p s.equal?(s2)
s2.push('x')
p s2
p s
