require 'bundler'
require 'json'
require 'set'

Bundler.require
DB = Sequel.sqlite 'database.sqlite3'
require './models.rb'

def json_or_error(o)
  o.to_json rescue "{ 'error': 'not found' }"
end

RANKS = %w{superkingdom phylum class order family genus species}.to_set

def build_taxonomy(node)
  taxonomy = []
  return 'null' if node.nil?
  while ( node[:id] != 1 && !node.nil? )
    taxonomy << node[:name] if RANKS.include? node[:rank]
    parent_id = node[:parent_id]
    node = Node[parent_id]
  end
  taxonomy.reverse.join(';')
end
