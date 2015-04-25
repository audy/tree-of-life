desc 'start interactive console'
task :console do
  require './environment.rb'
  binding.pry
end

desc 'update names and nodes databases'
task :update_database do
  require './environment.rb'
  pbar = ProgressBar.new 'nodes', File.size('nodes.dmp')

  # first load nodes
  nodes =
    File.open('nodes.dmp') do |handle|
      handle.map do |line|
        pbar.set handle.pos
        line = line.strip.split
        # child_id, parent_id
        [ line[0].to_i, [ line[2].to_i ] ]
      end
  end

  # child_id -> [ parent_id, ... ]
  nodes = Hash[nodes]

  # then load names
  pbar = ProgressBar.new 'names', File.size('names.dmp')

  # go back and add names
  File.open('names.dmp') do |handle|
    handle.map do |line|
      line = line.strip.split("\t")
      node_id, name, type = line[0].to_i, line[2], line[6]
      # we only want real scientific names
      next unless type == 'scientific name'
      nodes[node_id] << name
      pbar.set handle.pos
    end
  end


  pbar.finish
  puts "loaded #{nodes.size} nodes/names"
  puts 'bulk importing...'
  DB.transaction do
    DB[:nodes].import([:taxon_id, :parent_id, :name], nodes.map { |x| x.to_a.flatten })
  end
end

namespace :db do
  task :migrate do
    require './environment.rb'
    DB.create_table :nodes do
      Integer :taxon_id, index: true
      Integer :parent_id, index: true
      String :name, index: true
    end
  end
end

task :load_names do
  require './environment.rb'
end
