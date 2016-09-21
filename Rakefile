desc 'start interactive console'
task :console do
  require './environment.rb'
  binding.pry
end

desc 'dump all full taxonomies (KPCOFGS) to a CSV file'
task :dump do
end


namespace :db do
  task :migrate do
    require './environment.rb'
    DB.create_table :nodes do
      primary_key :id
      Integer :parent_id, index: true
      String :name, index: true
      String :rank, index: true
    end
  end

  desc 'seed names and nodes databases'
  task :seed => :migrate do
    require './environment.rb'

    pbar = ProgressBar.new 'nodes', File.size('nodes.dmp')

    # first load nodes
    # child_id -> [ parent_id, ... ]
    nodes =
        File.open('nodes.dmp') do |handle|
          handle.map do |line|
            pbar.set handle.pos
            line = line.strip.split
            node_id = Integer(line[0])
            parent_id = Integer(line[2])
            rank = line[4]
            # child_id: [ parent_id, rank ]
            [ node_id, [ parent_id, rank ] ]
          end
        end.to_h

    # then load names
    pbar = ProgressBar.new 'names', File.size('names.dmp')

    # go back and add names
    File.open('names.dmp') do |handle|
      handle.map do |line|
        # we only want real scientific names
        next unless line =~ /scientific name/
        line = line.strip.split("\t")
        node_id, name, type = line[0].to_i, line[2], line[6]
        nodes[node_id] << name
        pbar.set handle.pos
      end
    end

    pbar.finish
    puts "loaded #{nodes.size} nodes/names"
    puts 'bulk importing...'
    DB.transaction do
      DB[:nodes].import([:id, :parent_id, :rank, :name ], nodes.map { |x| x.to_a.flatten })
    end
  end
end
