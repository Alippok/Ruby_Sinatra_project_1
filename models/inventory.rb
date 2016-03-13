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
  end


    # @stocks.each do |stock|
      
    #   if stock.album_id == id
    #     return stock
    #   else 
    #     return "No stock with that id"
    #   end
    
    # end



  # def album_info(id)
  #   @albums.each do |album|
  #     if album.id == id
  #       return [album.title]      
  #     end
  #   end
  # end



end