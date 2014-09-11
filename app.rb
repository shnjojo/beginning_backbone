require 'sinatra'
require 'slim'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/static'

books = [{
  id: 98,
  author: 'Stephen King',
  title: 'The Shining',
  year: 1977
  }, {
  id: 99,
  author: 'George Orwell',
  title: 1949
}]

get '/' do
  slim :index
end

get '/books' do
  content_type :json
  books.to_json
end

get '/book/:id' do
  @id = params[:id].to_s
  @book = {}
  
  books.each do |book|
    @book = book if @id == book[:id].to_s
  end
  
  content_type :json
  @book.to_json
end