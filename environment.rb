require 'bundler'
Bundler.require :default

require './models.rb'

# SET UP THE DATABASE!
DataMapper.finalize

# connect
DataMapper.setup(
  :default,
  ENV['DATABASE_URL'] || 'postgres://_postgres@localhost/taxondb')

DataMapper::Model.raise_on_save_failure = true

DataMapper.auto_upgrade!