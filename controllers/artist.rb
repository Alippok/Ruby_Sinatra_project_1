require_relative('../models/artist.rb')


get '/artists' do
  @artists = Artist.all
  erb(:"artist/index")
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  @albums = @artist.albums
  erb(:"artist/show")
end

get '/artists/new' do
  erb(:"artist/new")
end


post '/artists' do
  Artist.create(params)
  redirect to '/artists'
end

get '/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb(:"artist/edit")
end

post '/artists/:id' do
  @artist = Artist.new(params)
  @artist.update
  redirect to '/artists'
end

post '/artists/:id/delete' do

  Artist.delete(params['id'])
  redirect to '/artists'
end #The artists are referenced in another table so need to work on this route
