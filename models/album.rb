require_relative('../db/sql_runner.rb')

class Album

  attr_reader(:title, :artist_id, :buy_price, :sell_price)

  def initialize(params)
    @id = nil || params['id']
    @title = params['title']
    @artist_id = params['artist_id']
    @buy_price = params['buy_price']
    @sell_price = params['sell_price']
  end

  def self.create(params)
    sql = "INSERT INTO albums(
    title,
    artist_id,
    buy_price,
    sell_price) VALUES(
    '#{params['title']}',
    '#{params['artist_id']}',
    #{params['buy_price']},
    #{params['sell_price']})
    "
    SqlRunner.execute(sql)
    return Album.new(Album.last_entry)
  end

  def self.last_entry
    sql = "SELECT * FROM albums ORDER BY id DESC limit 1"
    SqlRunner.execute(sql).first
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.execute(sql)
  end




end