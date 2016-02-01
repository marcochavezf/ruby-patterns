require 'sinatra'

set :port, 9999

before do
  content_type 'text/html; charset=US-ASCII'
end

configure do
  set :show_exceptions, false
end

after do
  puts "Just finished!"
end

get '/x' do
  erb :x
end

get '/:name/:lastname' do |name, lastname|
  @name = "<em>#{ name } #{ lastname }</em>"
  @friends = ['Joe','Gill','Eli']
  headers 'X-Hello-Message' => "Hello World!"
  erb :hello
end

get %r{/(a*b)/} do |x|
  raise 'What?'
  "Value #{ x }"
end

post '/doit' do
  "Done. Param Values: name=#{ params[:name] }, age=#{ params[:age] }"
end

#error do
#  "Y U NO WORK!"
#end
#
#not_found do
#  '404 Not Found'
#end


