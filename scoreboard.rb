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
    @usname_1 = params["github_handle_1"]
    @usname_2 = params["github_handle_2"]
    @store = YAML::Store.new 'battles.yml'
    @store.transaction do
        @store['battle_2'] ||= {}
        @store['battle_2'][:battle_id] = 2
        @store['battle_2'][:github_handle_1] = @usname_1
        @store['battle_2'][:github_handle_2] = @usname_2
    end
end