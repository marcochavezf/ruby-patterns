# Lab 1: Unit Testing
# Date: 18-Jan-2012
# Authors:
# Author:
# Marco Chávez
# File name: test_deque.rb

require 'test/unit'
require 'deque'

class Test_Deque < Test::Unit::TestCase
  
  
  def test_one
    queue = Deque.new(2,3,4)
    assert_equal "[2, 3, 4, 5]", queue.push_back(5).to_s
    assert_equal "[1, 2, 3, 4, 5]", queue.push_front(1).to_s
    assert_equal 5, queue.pop_back
    assert_equal 1, queue.pop_front
    assert_equal 4, queue.back
    assert_equal 2, queue.front
    assert_equal false, queue.empty?
    assert_equal 3, queue.length
    assert_equal 3, queue.size
    assert_equal "front -> [2, 3, 4] <- back", queue.inspect
    queue.pop_front
    queue.pop_front
    queue.pop_front
    assert_equal nil, queue.pop_front
  end
  
  def test_two
    queue = Deque.new()
    assert_equal nil, queue.pop_back
    assert_equal "[1]", queue.push_back(1).to_s
    assert_equal "[2, 1]", queue.push_front(2).to_s
    assert_equal 1, queue.pop_back
    assert_equal 2, queue.pop_front
    assert_equal true, queue.empty?
    assert_equal 0, queue.length
    assert_equal 0, queue.size
    assert_equal "front -> [] <- back", queue.inspect
  end
  
end
