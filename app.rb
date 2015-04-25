require './environment.rb'

set :port, 9999
#set :server, 'thin'
set :environment, :development
#set :lock, true


get '/search/:query' do
  matches = Node.first( :name => /#{params[:query]}/i )#.limit(100).map(&:name)
  json_or_error matches
end

get '/name/:name' do
  json_or_error Node.first( :name => params[:name] )
end

get '/taxonomy/:name' do
  taxonomy = build_taxonomy(Node.first( :name => params[:name] ))
  json_or_error :taxonomy => taxonomy
end

get '/taxid/:id' do
  $stderr.puts params.inspect
  taxonomy = build_taxonomy(Node.first( :taxon_id => params[:id].to_i ))
  json_or_error :taxonomy => taxonomy
end
