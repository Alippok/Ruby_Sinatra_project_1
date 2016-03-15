class StockView

attr_reader(:album_id, :album_title, :artist_name, :quantity)

  def initialize(id, title, name, quantity)
    @album_id = nil || id
    @album_title = nil || title
    @artist_name = nil || name
    @quantity = nil || quantity
  end

  def self.map_items(object)
   result = object.map{|stock_object| StockView.new(stock_object['album_id'], stock_object['title'], stock_object['name'], stock_object['quantity'])}
   return result
  end


end