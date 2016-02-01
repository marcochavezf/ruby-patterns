#!/usr/bin/env ruby
# File: student.rb

class Student

  MINIMUM_GRADE = 85
  HIGHEST_INCOME = 15_000

  attr_reader :name, :id
  attr_accessor :anual_income
        
  def initialize(params)
    @name = params.fetch(:name, 'Unknown')
    @id = params.fetch(:id, 0)
    @anual_income = params.fetch(:anual_income, 0)
    @grades = []        
  end
  
  def add_grade(grade)
    @grades << grade
    self
  end
  
  def display_info
    display_personal_information
    display_disclaimer
  end
  
  def scholarship_worthy?
    # A student is worthy of a scholarship if he/she has good grades and
    # is poor.
    has_good_average = grade_average >= MINIMUM_GRADE
    is_poor = @anual_income < HIGHEST_INCOME 
    has_good_average and is_poor
  end
  
  private
  
  def display_personal_information
    puts "Name: #{ @name } ID: #{ @id }"
    puts "Anual income: #{ @anual_income }"
    puts "Grade average: #{ grade_average }"
  end
  
  def display_disclaimer
    puts 'The contents of this class must not be considered an offer,'
    puts 'proposal, understanding or agreement unless it is confirmed'
    puts 'in a document signed by at least five blood-sucking lawyers.'
  end
  
  def grade_average
    # Nothing reasonable to do if this student has currently no grades. 
    raise "Can't compute average with no grades" if  @grades.empty?
    #sum = 0
    #@grades.each { |grade| sum += grade }
    @grades.inject(0, :+) / @grades.size.to_f
  end
  
end