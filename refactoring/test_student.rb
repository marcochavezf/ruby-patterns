#!/usr/bin/env ruby
require 'test/unit'
require 'stringio'
require 'student'

class StudentTest < Test::Unit::TestCase
  
  def setup
    @out = StringIO.new
    @old_stdout = $stdout
    $stdout = @out
    @s = Student.new(name:'John', id:123, anual_income:12_000)
  end

  def teardown
    $stdout = @old_stdout
  end
  
  def test_display_info
    @s.add_grade(77).add_grade(81)
    @s.display_info
    assert_equal \
      "Name: John ID: 123\n" \
      "Anual income: 12000\n" \
      "Grade average: 79.0\n" \
      "The contents of this class must not be considered an offer,\n" \
      "proposal, understanding or agreement unless it is confirmed\n" \
      "in a document signed by at least five blood-sucking lawyers.\n", \
      @out.string
  end
  
  def test_attribute_anual_income
    assert_equal 12_000, @s.anual_income
    @s.anual_income = 12_500
    assert_equal 12_500, @s.anual_income
    @s.anual_income = 0
    assert_equal 0, @s.anual_income
  end
  
  def test_scholarship_worthy?
    assert_raise RuntimeError do
      @s.scholarship_worthy?
    end
    @s.add_grade(92).add_grade(87).add_grade(83)
    assert @s.scholarship_worthy?
    @s.add_grade(20)
    assert(not(@s.scholarship_worthy?))
    s2 = Student.new(name:'John', id:123, anual_income:16_000)
    s2.add_grade(90).add_grade(95)
    assert(not(s2.scholarship_worthy?))
    s2.add_grade(15)
    assert(not(s2.scholarship_worthy?))
  end
end