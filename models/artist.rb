require_relative('../db/sql_runner.rb')

class Artist

  attr_reader(:name, :id)

  def initialize(params)
    @name = params['name']
    @id = nil || params['id']
  end


  

  def self.create(params)
    sql = "INSERT INTO artists(
    name) VALUES(
    '#{params['name']}')"
    SqlRunner.execute(sql)
    return Artist.new(Artist.last_entry)
  end

  def self.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.execute(sql)
    return Artist.map_items(artists)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    artist = SqlRunner.execute(sql)
    return Artist.map_item(artist)
  end
  
  def self.last_entry
    sql = "SELECT * from artists ORDER BY id DESC limit 1;"
    SqlRunner.execute(sql).first
  end

  def self.map_items(object)
    return object.map{|artist| Artist.new(artist)}  
  end

  def self.map_item(object)
    artist = Artist.map_items(object)
    return artist.first
  end




  def self.delete_all
    sql = "DELETE from artists"
    SqlRunner.execute(sql)
  end








end