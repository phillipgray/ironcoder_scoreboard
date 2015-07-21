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
    @title = "Added"
    @section_title = "New code battle successfully added!"
    @store = YAML::Store.new 'battles.yml'
    @store.transaction do
        @newest_battle = @store[:newest_battle_id]
        @newest_battle += 1
        @store['battle_#{@newest_battle}'] ||= {}
    
end