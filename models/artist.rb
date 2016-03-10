require_relative('../db/sql_runner.rb')

class Artist

  attr_reader(:name, :id)

  def initialize(params)
    @name = params['name']
    @id = nil || params['id']
  end

  def save
    sql = "INSERT INTO artists(
    name) VALUES(
    '#{@name}')"
    SqlRunner.execute(sql)
  end


  def self.create(params)
    @artist = Artist.new(params)
    @artist.save
  end




  def self.delete_all
    sql = "DELETE from artists"
    SqlRunner.execute(sql)
  end







end