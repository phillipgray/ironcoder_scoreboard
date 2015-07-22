require 'sinatra'
require 'yaml/store'

# note about running sinatra on Cloud 9
# to start the server:
# "ruby basics.rb -p $PORT -o $IP"



get '/' do
    @title = "Home"
    @section_title = "Current Challenges"
    @store = YAML::Store.new 'battles.yml'
    
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
    last_battle_id = @store.transaction { @store[:newest_battle_id] }
    next_battle_id = last_battle_id + 1
    battle_name = "battle_#{next_battle_id}".to_sym
    @store.transaction do
        @store['battles'] ||= []
        @store['battles'][last_battle_id] = { 
            :battle_id => next_battle_id,
            :github_handle_1 => @usname_1,
            :github_handle_2 => @usname_2,
        }
        @store[:newest_battle_id] = next_battle_id
    end
    erb :home
end