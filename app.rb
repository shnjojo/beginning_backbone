require 'sinatra'
require 'slim'
require 'json'
# For debug
require 'pry'

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

# Get all books
get '/books' do
  content_type :json
  books.to_json
  
  puts books
end

# Get single book
get '/books/:id' do
  @id = params[:id].to_s
  @book = {}
  
  books.each do |book|
    @book = book if @id == book[:id].to_s
  end
  
  content_type :json
  # 
  @book.to_json
end

# Add a book
post '/books' do
  @book = JSON.parse request.body.read
  books << @book
   
end

# Change a book
put '/books/:id' do
  @id = params[:id].to_s
  @book = JSON.parse request.body.read
  
  # Sinatra get json value with json_data['key'],
  # so weird, maybe node.js is more suitable for Restful Api?
  books.each do |book|
    if book[:id].to_s == @id
       book[:title] = @book['title']
       book[:author] = @book['author']
       book[:year] = @book['year']
    end
  end
  # 
end

# Delete a book
delete '/books/:id' do
  @id = params[:id].to_s
  
  books.delete_if {|book| book[:id].to_s == @id}
  
  # 
end