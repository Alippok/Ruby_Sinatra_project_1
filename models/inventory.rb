require_relative('../db/sql_runner.rb')

class Inventory

  attr_reader( :stock, :albums, :artitsts, :account)

  def initialize(params)
   @stock = params['stocks']
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
    @stock.each do |stock|
      stock_hash["Stock #{index}"] = [stock.album_id, stock.quantity]
      index +=1
    end
    return stock_hash
  end

  def stock_search(id)
    @stock.each do |stock|
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


  def total_sell_amount(album_sell_price, quantity)
    return album_sell_price * quantity
  end

  def sell_transaction(album_sell_price, quantity)
    amount = total_sell_amount(album_sell_price, quantity)
    @account.add(amount)
    return @account.balance
  end


  def total_buy_cost(album_buy_price, quantity)
    return album_buy_price * quantity
  end

  def buy_transaction(album_buy_price, quantity)
    cost = total_buy_cost(album_buy_price, quantity)
    @account.take(cost)
    return @account.balance
  end

  def stock_quantity(album_id)
    return stock_search(album_id).quantity
  end

  def updated_quantity(album_id, quantity)
      return updated_quantity = stock_quantity(album_id).to_i + quantity.to_i
  end

  def sell_quantity(album_id, quantity)
    return quantity_after_sale = stock_quantity(album_id).to_i - quantity.to_i
  end

  def full_stock_search(album_id)
    stock_item = stock_search(album_id)
    album = stock_info(album_id)
    artist = artist_info(album_id) 
    if album.class == String
      return "Album not stocked"
    else
      return info = {
        'album_title' => album.title,
        'album_artist' => artist.name,
        'buy_price' => album.buy_price,
        'sell_price'=> album.sell_price,
        'current_quantity' => stock_item.quantity
      }
    end
  end

  def buy_stock(album_id, quantity)
    info = full_stock_search(album_id)
    if info.class == String
      return info
    else
      new_quantity = updated_quantity(album_id, quantity) 

      buy_transaction(info['buy_price'], quantity)
      
      return new_stock = {'album_id' => album_id, 'quantity' => new_quantity}
    end
  end

  def sell_stock(album_id, quantity)
      info = full_stock_search(album_id)
      if info.class == String
        return info
      else
        new_quantity = sell_quantity(album_id, quantity) 

        sell_transaction(info['sell_price'], quantity)
        
        return new_stock = {'album_id' => album_id, 'quantity' => new_quantity}
      end
    end

  def quantity_check(quantity)
    if quantity.to_i >= 10
      return "HIGH - no action needed"
    elsif quantity.to_i >= 5
      return "MEDIUM - order stock soon"
    else quantity.to_i >= 1
      return "LOW - order stock now"
    end
  end

  def markup(buy_price, sell_price)
    return sell_price.to_i - buy_price.to_i
  end

  def total_revenue(markup_amount, quantity)
    return markup_amount.to_i * quantity.to_i
  end

  #do a total possible sales method by:    markup * quanity??
end