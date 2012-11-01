require './environment.rb'

set :port, 9999
#set :server, 'thin'
set :environment, :development
#set :lock, true

puts "indexing... "
Node.ensure_index :taxon_id
Node.ensure_index :name
puts "done"

def json_or_error(o)
  o.to_json rescue "{ 'error': 'not found' }"
end

def build_taxonomy(node)
  taxonomy = []
  return 'null' if node.nil?
  while ( node.taxon_id != 1 && !node.nil? )
    taxonomy << node.name
    parent_id = node.parent_id
    node = Node.first( :taxon_id => parent_id )
  end
  taxonomy.reverse.join(';')
end

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
