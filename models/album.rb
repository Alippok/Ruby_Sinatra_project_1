require_relative('../db/sql_runner.rb')

class Album

  attr_reader(:title, :artist_id, :buy_price, :sell_price)

  def initialize(params)
    @title = params['title']
    @artist_id = params['artist_id']
    @buy_price = params['buy_price']
    @sell_price = params['sell_price']
  end

 







end