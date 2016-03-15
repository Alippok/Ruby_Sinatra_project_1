class StockView

attr_reader(:album_title, :artist_name, :quantity)

  def initialize(title, name, quantity)
    @album_title = nil || title
    @artist_name = nil || name
    @quantity = nil || quantity
  end

  def self.map_items(object)
   result = object.map{|stock_object| StockView.new(stock_object['title'], stock_object['name'], stock_object['quantity'])}
   return result
  end


end