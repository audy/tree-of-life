require 'bundler'
require 'json'

Bundler.require
DB = Sequel.sqlite 'database.sqlite3'
require './models.rb'

def json_or_error(o)
  o.to_json rescue "{ 'error': 'not found' }"
end

def build_taxonomy(node)
  taxonomy = []
  return 'null' if node.nil?
  while ( node[:taxon_id] != 1 && !node.nil? )
    taxonomy << node[:name]
    parent_id = node[:parent_id]
    node = Node.first( :taxon_id => parent_id )
  end
  taxonomy.reverse.join(';')
end
