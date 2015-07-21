require 'sinatra'
require 'yaml/store'

# note about running sinatra on Cloud 9
# to start the server:
# "ruby basics.rb -p $PORT -o $IP"

get '/' do
    @title = "Home"
    @section_title = "Current Challenges"
    erb :home
end

get '/new' do
   @title = "New"
   @section_title = "Add New Challenge"
   erb :new
end

post '/new' do
    
end