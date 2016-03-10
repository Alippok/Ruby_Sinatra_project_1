require_relative('../db/sql_runner.rb')

class Artist

  attr_reader(:name, :id)

  def initialize(params)
    @name = params['name']
    @id = nil || params['id']
  end

  







end