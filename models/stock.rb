require_relative('../db/sql_runner.rb')

class Stock

  attr_reader(:id, :artist_id, :album_id, :quantity)

  def initialize(params)
    @id = nil || params['id']
    @album_id = params['album_id']
    @quantity = nil || params['quantity']
  end

  def self.create(params)
    sql = "INSERT INTO stocks
    (album_id,
    quantity) 
    VALUES(
    #{params['album_id']},
    #{params['quantity']})"
    SqlRunner.execute(sql)
    return Stock.new(Stock.last_entry)    
  end


  def self.last_entry
    sql = "SELECT * FROM stocks ORDER BY id DESC limit 1"
    SqlRunner.execute(sql).first
  end
  
  def self.all
    sql = "SELECT * FROM stocks"
    return Stock.map_items( SqlRunner.execute(sql) ) 
  end

  def self.find(id)
    sql = "SELECT * from stocks WHERE id =#{id}"
    return Stock.map_item( SqlRunner.execute(sql) )
  end

  def self.map_items(object)
    return object.map{|stock_item| Stock.new(stock_item)}
  end


  def self.map_item(object)
    stock = Stock.map_items(object)
    return stock.first    
  end
  
  def self.delete(id)
    sql = "DELETE FROM stocks WHERE id=#{id}"
    SqlRunner.execute(sql)
  end

  def self.delete_all
    sql = "DELETE FROM stocks"
    SqlRunner.execute(sql)
  end






end