require 'data_mapper'
require 'dm-sqlite-adapter'
require 'progressbar'
require 'pry'

class Node
  include DataMapper::Resource
  
  property :id, Integer, :key => true
  property :parent, Integer
  property :name, String
end

# SET UP THE DATABASE!
DataMapper.finalize
DataMapper.setup(:default, :adapter => 'sqlite', :database => "test.db")
DataMapper::Model.raise_on_save_failure = true
DataMapper.auto_upgrade!

##
# Return an array with a full taxonomic description given a name
#
def get_taxonomy(name)

  taxonomy = Array.new
  node_id = Node.first(:name => name)

  while node_id != 1 && !node_id.nil?
    parent = Node.get(node_id)
    node_id = parent.id
    parent.name
  end.collect
end

task :update_database => [:load_ids, :load_names] do
end

task :console do
  binding.pry
end

task :load_ids do
  pbar = ProgressBar.new 'loading ids', `wc -l nodes.dmp`.strip.split.first.to_i
  
  # first load nodes
  File.open('nodes.dmp') do |handle|
    handle.each do |line|
      pbar.inc
      line = line.strip.split
      node_id, parent_id, level = line[0], line[2], line[4]
      node = Node.new :id => node_id, :parent => parent_id
      node.save
    end
  end
  pbar.finish
end

task :load_names do
  pbar = ProgressBar.new 'loading names', `grep -c "scientific name" names.dmp`.strip.to_i

  # go back and add names
  File.open('names.dmp') do |handle|
    handle.each do |line|
      pbar.inc
      line = line.strip.split("\t")
      node_id, name, type = line[0], line[2], line[6]
      next if type != 'scientific name'
      node = Node.get(node_id)
      if !node.nil?
        node.update! :name => name
      else
        puts "missing node: #{node_id}: #{name}"
      end
    end
  end

  pbar.finish
end