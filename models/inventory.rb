require_relative('../db/sql_runner.rb')

class Inventory

  attr_reader(:account, :stocks, :albums, :artitsts)

  def initialize(params)
   @account = 500
   @stocks = params['stocks']
   @albums = params['albums']
   @artists = params['artists']
   
  end

  def artists
    return @artists.map{|artist| artist.name}
  end






end