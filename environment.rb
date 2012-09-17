require 'bundler'
Bundler.require

require './models.rb'

MongoMapper.connection = Mongo::Connection.new('127.0.0.1')
MongoMapper.database = 'taxondb'
