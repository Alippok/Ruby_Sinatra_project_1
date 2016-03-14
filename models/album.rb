require_relative('../db/sql_runner.rb')
require_relative('../models/artist.rb')

class Album

  attr_reader(:id, :title, :artist_id, :buy_price, :sell_price)

  def initialize(params)
    @id = nil || params['id']
    @title = params['title']
    @artist_id = params['artist_id']
    @buy_price = 5 #params['buy_price']
    @sell_price = params['sell_price']
  end

  def update
    sql = "UPDATE albums SET
            title = '#{@title}',
            artist_id = '#{@artist_id}',
            buy_price = #{@buy_price},
            sell_price = #{sell_price}
            WHERE id=#{@id} "
    SqlRunner.execute( sql )
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


  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.execute(sql)
    return Album.map_items(albums)
  end


  def self.find(id)
    sql = "SELECT * FROM albums WHERE id =#{id}"
    album = SqlRunner.execute(sql)
    return Album.map_item(album)
  end


  def self.artist(artist_id)
    sql = "SELECT * FROM  artists WHERE artists.id=#{artist_id}"
    return Artist.map_item( SqlRunner.execute(sql) )
  end

  

  def self.map_items(object)
    return object.map{|album| Album.new(album)}  
  end


  def self.map_item(object)
    album = Album.map_items(object)
    return album.first
  end

  def self.delete(id)
    sql = "DELETE FROM albums WHERE id = '#{id}'"
    SqlRunner.execute( sql )
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.execute(sql)
  end




end