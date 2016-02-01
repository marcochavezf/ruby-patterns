# Final Project: Design Patterns Quiz App
# Date: 8-May-2012
# Author:
# Marco Chávez
require 'activerecord'

class Quiz < ActiveRecord
  
  def self.create_quiz
    
    DATABASE.execute("delete from quiz")
    
    file_questions = File.new("questions.txt", "r")
    file_answers = File.new("answers.txt", "r")
    loop do
      question = file_questions.gets
      answer = file_answers.gets
      
      if question.nil? || answer.nil?
        break
      end
      
      q = Quiz.new(question: question, answer: answer)
      q.save
    end
    file_questions.close
    file_answers.close
    
    row = Quiz::DATABASE.execute('select * from quiz')
    p row
  end
    
  def self.gen_id_norepeatead_in(id_questions_asked)
    loop do
      new_id = Random.rand(1..30)
      if not(id_questions_asked.include?(new_id))
        return new_id
      end
    end
  end
    
  def self.get_answer(id_question)
    q = Quiz.find(id_question)
    q.answer
  end
  
  def self.get_question(id_question)
    q = Quiz.find(id_question)
    q.question
  end
  
  def self.get_multiple_answers(id_question)
    multiple_answers = []
    pos_right_answer = Random.rand(1..4)
    (1..4).each do |i|
      answer = ""
      if i == pos_right_answer
        answer = get_answer(id_question)
      else
        answer = get_answer(gen_id_norepeatead_in([id_question]))
      end
      multiple_answers << answer
    end
    multiple_answers
  end
  
  text_field :question
  text_field :answer
  create_table
  
end