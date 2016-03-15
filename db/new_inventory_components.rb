require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/stock.rb')
require_relative('../models/stock_view.rb')
require_relative('../models/account.rb')



class InventoryComponents
  
  attr_reader(:account, :options)

  def initialize(params)
    @account = Account.new(params['account_balance'].to_i)
    @options = {
     'stocks' => Stock.all,
     'albums' => Album.all,
     'artists'=> Artist.all,
     'account'=> @account
    }

  end





end