require './environment.rb'

set :port, 9999
set :bind, '0.0.0.0'
set :environment, :development

get '/search/:query' do
  json_or_error Node.where(Sequel.ilike(:name, "%#{params[:query]}%")).first(10).map { |x| { x.taxon_id => build_taxonomy(x) } }
end

get '/name/:name' do
  json_or_error Node.first(name: params[:name])
end

get '/taxonomy/:name' do
  taxonomy = build_taxonomy(Node.first(name: params[:name]))
  json_or_error taxonomy: taxonomy
end

get '/taxid/:id' do
  taxonomy = build_taxonomy(Node[params[:id].to_i])
  json_or_error taxonomy: taxonomy
end
