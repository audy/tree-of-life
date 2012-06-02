require './environment.rb'

get '/search' do
  get_taxonomy(params[:q])
end

Sinatra::Application.run!