#!/usr/bin/env ruby

class Student
  
  include Comparable  
  
  def initialize(id, name)
    @id = id
    @name = name
  end
  
  attr_reader :id ,:name
  
  def ==(other)
    if other.kind_of?(Student)
      self.id == other.id
    else
      false
    end
  end
  
  def <=> (other)
    @id <=> other.id
  end
  
  def inspect
    "Student(#{ @id }, #{ @name })"
  end
  
end

class WorkingStudent < Student
end

c1 = Student.new(123, 'John')
c2 = Student.new(234, 'Maria')
c3 = WorkingStudent.new(666, 'Damian')

#p c1 == [1,2,3]
#p c1 == c2
#p c1 == c3
#p c3 > c1
p c2.between?(c1, c3)
a = [c2, c3, c1]
p a.sort { |x, y| y <=> x }
p a.sort { |x, y| x.name <=> y.name }