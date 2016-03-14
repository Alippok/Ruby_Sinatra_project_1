require_relative('../db/sql_runner.rb')

class Inventory

  attr_reader( :stocks, :albums, :artitsts, :account)

  def initialize(params)
   @stocks = params['stocks']
   @albums = params['albums']
   @artists = params['artists']
   @account = params['account']
   
  end

  def artists
    return @artists.map{|artist| artist.name}
  end

  def account_balance
    return @account.balance
  end

  def stocks
    stock_hash = {}
    index = 1
    @stocks.each do |stock|
      stock_hash["Stock #{index}"] = [stock.album_id, stock.quantity]
      index +=1
    end
    return stock_hash
  end

  def stock_search(id)
    @stocks.each do |stock|
      if stock.album_id == id
        return stock
      end
    end
    return "No stock with that album id"
  end#this method returns all stock if the id is not present. How to stop this? 

  def stock_info(id)
    stock_item = stock_search(id)
    if stock_item.class == String 
      return "No album to be searched for"
    else
      album_id = stock_item.album_id

      @albums.each do |album|
        if album.id == id
          return album
        end
      end
    end
    return "No album with that id stocked"
  end#Because of the above method return the whole array of stock items if it doesnt find
  #one matching the id, this affects the search in this method.NEED TO SOLVE!
  #Also, the above does not include the QUANTITY! Will need pick anc choose what to display 
  #to the user in the VIEWS. FIXED

  def artist_info(id)
    album = stock_info(id)
    if album.class == String
      return "This artist is not stocked"
    else
      @artists.each do |artist|
        if artist.id == album.artist_id
          return artist
        end
      end
    end
    return "No artist with that id stocked"
  end

  def total_buy_cost(album_buy_price, quantity)
    return album_buy_price * quantity
  end

  def buy_transaction(album_buy_price, quantity)
    cost = total_buy_cost(album_buy_price, quantity)
    @account.take(cost)
  end

  def stock_quantity(album_id)
    return stock_search(album_id).quantity
  end


end