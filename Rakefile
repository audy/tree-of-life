desc 'update names and nodes databases'
task :update_database => [:load_nodes, :load_names] do
end

task :console do
  require './environment.rb'
  binding.pry
end

task :load_nodes do
  require './environment.rb'
  pbar = ProgressBar.new 'nodes', File.size('nodes.dmp')

  # first load nodes
  File.open('nodes.dmp') do |handle|
    handle.each do |line|
      pbar.set handle.pos
      line = line.strip.split
      node_id, parent_id, level = line[0], line[2], line[4]
      node = Node.new(:taxon_id => node_id, :parent_id => parent_id)
      node.save
    end
  end
  pbar.finish
end

task :load_names do
  require './environment.rb'
  pbar = ProgressBar.new 'names', File.size('names.dmp')

  # go back and add names
  File.open('names.dmp') do |handle|
    handle.each do |line|

      line = line.strip.split("\t")

      node_id, name, type = line[0].to_i, line[2], line[6]

      # we only want real scientific names
      next unless type == 'scientific name'

      pbar.set handle.pos
      node = Node.first( :taxon_id => node_id)

      unless node.nil?
        node.update_attributes(:name => name)
        node.save
      else
        puts "missing: #{node_id}, #{name}"
      end
    end
  end

  pbar.finish
end
