require_relative('../db/sql_runner.rb')

class Stock

  attr_reader(:id, :artist_id, :album_id, :quantity)

  def initialize(params)
    @id = nil || params['id']
    @artist_id = params['artist_id']
    @album_id = params['album_id']
    @quantity = 0
  end






  def self.create(params)
    sql = "INSERT INTO stocks(
    artist_id,
    album_id,
    quantity) VALUES(
    #{params['artist_id']},
    #{params['album_id']},
    #{params['quantity']})"
    SqlRunner.execute(sql)
    return Stock.new(Stock.last_entry)    

  end


  def self.last_entry
    sql = "SELECT * FROM stocks ORDER BY id DESC limit 1"
    SqlRunner.execute(sql).first
  end
  

  def self.map_items

  end


  def self.map_item

  end


  def self.delete_all

  end






end