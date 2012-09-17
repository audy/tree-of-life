class Node
  include MongoMapper::Document
  key :taxon_id, Integer
  key :parent_id, Integer
  key :name, String
end
