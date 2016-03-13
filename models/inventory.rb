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


  # def album_info(id)
  #   @albums.each do |album|
  #     if album.id == id
  #       return [album.title]      
  #     end
  #   end
  # end



end