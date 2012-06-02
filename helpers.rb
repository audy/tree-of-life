helpers do

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

end