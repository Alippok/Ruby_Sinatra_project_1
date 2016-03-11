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
  
  def self.last_entry
    sql = "SELECT * from artists ORDER BY id DESC limit 1;"
    SqlRunner.execute(sql).first
  end


  def self.delete_all
    sql = "DELETE from artists"
    SqlRunner.execute(sql)
  end








end