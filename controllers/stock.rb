require_relative('../models/stock.rb')
require_relative('../models/stock_view.rb')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require('pry-byebug')


get '/stock' do
  @stock_views = StockView.map_items(Stock.full_info)
  erb(:"stock/index")
end

get '/stock/new' do
  @albums = Album.all
  erb(:"stock/new")
end

post '/stock' do 
  Stock.create( params )
  redirect to '/'
end





#Finish off stock views
#Then onto transaction views and logic