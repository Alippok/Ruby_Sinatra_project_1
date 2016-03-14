require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/artist.rb')
require_relative('./controllers/album.rb')
require_relative('./controllers/stock.rb')
require_relative('./controllers/inventory.rb')
require('pg')

get '/' do
  erb(:home)
end