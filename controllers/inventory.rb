require_relative('../models/inventory.rb')
require_relative('../models/stock.rb')
require_relative('../models/stock_view.rb')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/account.rb')
require('pry-byebug')



get '/inventory' do
 @stock_views = StockView.map_items(Stock.full_info)
 @account = Account.new(500)
 params = {
  'stocks' => Stock.all,
  'albums' => Album.all,
  'artists'=> Artist.all,
  'account'=> @account
 }

 @inventory = Inventory.new(params)
 # pry.bye_bug
 erb(:"inventory/index")

end

get '/inventory/stock' do
  @stock_views = StockView.map_items(Stock.full_info)
  @account = Account.new(500)
  params = {
   'stocks' => Stock.all,
   'albums' => Album.all,
   'artists'=> Artist.all,
   'account'=> @account
  }

  @inventory = Inventory.new(params)
  erb(:"inventory/show")
end