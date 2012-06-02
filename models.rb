class Node
  include DataMapper::Resource

  property :id, Integer, :key => true
  property :parent, Integer
  property :name, String, :length => 200
end