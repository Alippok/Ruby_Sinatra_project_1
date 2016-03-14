require_relative('../models/artist.rb')


get '/artists' do
  @artists = Artist.all
  erb(:"artist/index")
end

get '/artists/new' do
  erb(:"artist/new")
end

post '/artists' do
  Artist.create(params)
  redirect to '/artists'
end



#create

#edit

#update

#destroy