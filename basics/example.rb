#!/usr/bin/env ruby

puts "Hello world!"

class Student
  
  def initialize(id, name)
    @id = 0
    self.id = id
    @name = name
  end
  
  #attr_reader :id
  #attr_writer :id
  attr_accessor :id, :name  
  
  def id= (value)
    if value >= 0
      @id = value
    end
  end
  
end

class WorkingStudent < Student
  
  def name
    super 
  end

  
end

class WhatEver
  def name
    "whatever"
  end
end


s = Student.new(123, 'John')
s.id = 321
puts s.id
puts s.name
puts s.class

s2 = WorkingStudent.new(666, 'Damian')
puts s2.id
puts s2.name
puts s2.class

w = WhatEver.new

class String
  def name
    "wtf!"
  end
  def size
    42
  end
end

a = [s, s2, w, "hi"]
a.each do |x|
  puts "#{ x.name }: #{ x.class }"
end

puts "hello".size
