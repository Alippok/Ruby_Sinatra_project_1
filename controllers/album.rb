require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require('pry-byebug')

get '/albums' do
  @albums = Album.all

  erb(:"/album/index")
end

get '/albums/new' do
  @artists = Artist.all#To select an artist to add an album to
  erb(:"album/new")
end

post '/albums' do
  Album.create(params)
  redirect to '/albums'
end

get '/albums/:id' do
  @album = Album.find(params['id'])
  erb(:"album/show")
end

get '/albums/:id/edit' do
  @album = Album.find(params['id'])
  erb(:"album/edit")
end

post '/albums/:id' do
  @album = Album.new(params)
  @album.update
  redirect to '/albums'
end

post '/albums/:id/delete' do
  Album.delete(params['id'])
  redirect to '/albums'
end 


