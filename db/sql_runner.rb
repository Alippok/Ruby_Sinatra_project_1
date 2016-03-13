require ('pg')

class SqlRunner
  @@db_credentials = { dbname: 'music_store', host: 'localhost'}

  def self.execute(sql)
    begin
      db = PG.connect( @@db_credentials )
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end


end