require_relative('../models/inventory.rb')
require_relative('../models/stock.rb')
require_relative('../models/stock_view.rb')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/account.rb')
require_relative('../db/new_inventory_components.rb')
require('pry-byebug')



get '/inventory' do
 @stock_views = StockView.map_items(Stock.full_info)
 @account = Account.new(500)
 options = {
  'stocks' => Stock.all,
  'albums' => Album.all,
  'artists'=> Artist.all,
  'account'=> @account
 }

 @inventory = Inventory.new(options)
 # pry.bye_bug
 erb(:"inventory/index")

end

get '/inventory/stock' do
  @stock_views = StockView.map_items(Stock.full_info)
  # @account = Account.new(params['account_balance'].to_i)
  # options = {
  #  'stocks' => Stock.all,
  #  'albums' => Album.all,
  #  'artists'=> Artist.all,
  #  'account'=> @account
  # }
  @inventory_components = InventoryComponents.new('account_balance'=>params['account_balance'])
  @inventory = Inventory.new(@inventory_components.options)
  erb(:"inventory/show")
end

post '/inventory/buy' do
  # @stock_views = StockView.map_items(Stock.full_info)
  # @account = Account.new(params['account_balance'].to_i)
  # options = {
  #  'stocks' => Stock.all,
  #  'albums' => Album.all,
  #  'artists'=> Artist.all,
  #  'account'=> @account
  # }
  @inventory_components = InventoryComponents.new('account_balance'=>params['account_balance'])
  @inventory = Inventory.new(@inventory_components.options)
 
  new_stock = @inventory.buy_stock( params['album_id'], params['quantity'].to_i)
  stock = Stock.new(new_stock)
  stock.update
  redirect to '/inventory'
end



post '/inventory/sell' do
  @stock_views = StockView.map_items(Stock.full_info)
  # @account = Account.new(params['account_balance'].to_i)
  # options = {
  #  'stocks' => Stock.all,
  #  'albums' => Album.all,
  #  'artists'=> Artist.all,
  #  'account'=> @account
  # }
  @inventory_components = InventoryComponents.new('account_balance'=>params['account_balance'])
  @inventory = Inventory.new(@inventory_components.options)

  new_stock = @inventory.sell_stock( params['album_id'], params['quantity'].to_i)
  stock = Stock.new(new_stock)
  stock.update
  redirect to '/inventory'
end