require './environment.rb'

desc 'update names and nodes databases'
task :update_database => [:load_nodes, :load_names] do
end

task :pushdb do
end

task :console do
  binding.pry
end

task :load_nodes do
  pbar = ProgressBar.new 'nodes', `wc -l nodes.dmp`.strip.split.first.to_i

  # first load nodes
  File.open('nodes.dmp') do |handle|
    handle.each do |line|
      pbar.inc
      line = line.strip.split
      node_id, parent_id, level = line[0], line[2], line[4]
      node = Node.new(:taxon_id => node_id, :parent_id => parent_id)
      node.save
    end
  end
  pbar.finish
end

task :load_names do
  pbar = ProgressBar.new 'names', `grep -c "scientific name" names.dmp`.strip.to_i

  # go back and add names
  File.open('names.dmp') do |handle|
    handle.each do |line|

      line = line.strip.split("\t")

      node_id, name, type = line[0].to_i, line[2], line[6]

      # we only want real scientific names
      next unless type == 'scientific name'

      pbar.inc
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
