#!/usr/bin/env ruby
#!/usr/bin/env ruby
# Lab 6: Adapter Pattern
# Date: 29-Feb-2012
# Author:
# Marco Chávez
# File: test_adapter.rb 

require 'test/unit'
require 'simple_queue'
require 'queue_adapter'

class QueueAdapterTest < Test::Unit::TestCase  

  def test_queue_adapter    
    q = SimpleQueue.new
    qa = QueueAdapter.new(q)
    assert q.empty?
    assert qa.empty?
    assert_nil qa.pop 
    qa.push("Foo")
    assert_equal "Foo", qa.peek
    assert !q.empty?
    assert !qa.empty?
    qa.push("Bar")
    assert_equal "Bar", qa.peek
    qa.push("Baz").push("Quux")
    assert_equal 4, q.size
    assert_equal 4, qa.size
    assert_equal "Quux", qa.peek
    assert_equal "Quux", qa.pop
    assert_equal "Baz", qa.peek
    assert_equal "Baz", qa.pop
    assert_equal "Bar", qa.peek
    assert_equal "Bar", qa.pop
    assert_equal "Foo", qa.peek
    qa.push("Goo")
    assert_equal "Goo", qa.peek
    assert_equal "Goo", qa.pop
    assert_equal "Foo", qa.peek
    assert_equal 1, qa.size
    assert_equal "Foo", qa.pop
    assert_nil qa.peek
    assert_nil qa.pop
    assert q.empty?
    assert qa.empty? 
    assert_equal 0, q.size
    assert_equal 0, qa.size
  end
  
end
