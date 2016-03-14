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
    return "No album with that id"
  end#Because of the above method return the whole array of stock items if it doesnt find
  #one matching the id, this affects the search in this method.NEED TO SOLVE!
  #Also, the above does not include the QUANTITY! Will need pick anc choose what to display 
  #to the user in the VIEWS. FIXED

  # def album_info(id)
  #   @albums.each do |album|
  #     if album.id == id
  #       return [album.title]      
  #     end
  #   end
  # end



end