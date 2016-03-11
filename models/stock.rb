require_relative('../db/sql_runner.rb')

class Stock

  attr_reader(:artist_id, :album_id, :quantity)

  def initialize(params)
    @artist_id = params['artist_id']
    @album_id = params['album_id']
    @quantity = 0
  end

  







end