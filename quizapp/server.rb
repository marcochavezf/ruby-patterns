# Final Project: Design Patterns Quiz App
# Date: 8-May-2012
# Author:
# Marco Chávez
require 'sinatra'
require 'quiz'

set :port, 9999

before do
  content_type 'text/html; charset=US-ASCII'
end

configure do
  set :show_exceptions, false
  enable :sessions
end

after do
  puts "Just finished!"
end

post '/start_quiz' do
  
  no_questions = params[:no_questions].to_i
  
  if(no_questions < 1 || no_questions > 10)
    puts "Invalid input!"
    redirect "index.html"
  end
    
  Quiz.create_quiz
    
  session[:no_questions] = no_questions
  session[:id_questions_asked] = []
  session[:no_right_answers] = 0
  session[:right_answer] = ""
  
  redirect '/display_question'
end

get '/display_question' do
  id_question = Quiz.gen_id_norepeatead_in(session[:id_questions_asked])
  session[:right_answer] = Quiz.get_answer(id_question)
  session[:id_questions_asked] << id_question
  @multiple_answers = Quiz.get_multiple_answers(id_question)
  @question = Quiz.get_question(id_question)
  erb :display_question
end

post '/display_feedback' do
  @feedback_message = "No... :( the answer was "
  if session[:right_answer] == params[:answer_selected]
    session[:no_right_answers] += 1
    @feedback_message = "Yes! :D the answer is "
  end
  @feedback_message << session[:right_answer]
  erb :feedback
end

post '/check_next_question' do
  if session[:id_questions_asked].length >= session[:no_questions]
    redirect '/end_of_quiz'
  else
    redirect '/display_question'
  end
end

get '/end_of_quiz' do
  erb :end_of_quiz
end

get '/restart_quiz' do
  session.clear
  redirect 'index.html'
end

error do
  session.clear
  "Y U NO WORK!"
end

not_found do
  session.clear
  '404 Not Found'
end