require 'sinatra'
require 'slim'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  slim :index
end