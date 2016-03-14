require_relative('../models/album.rb')

get '/albums' do
  @albums = Album.all
  erb(:index)
end

get '/albums/:id' do
  @album = Album.find(params['id'])
  @artist = Album.artist(params['artist_id'])
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