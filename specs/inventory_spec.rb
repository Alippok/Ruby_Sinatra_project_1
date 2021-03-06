require('minitest/autorun')
require('minitest/rg')
require_relative('../models/inventory.rb')
require_relative('../models/stock.rb')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/account.rb')


class TestInventory < MiniTest::Test


  def setup
    @artist1 = Artist.new( 'id' =>1, 'name' => 'Metallica')
    @artist2 = Artist.new( 'id' =>2, 'name' => 'ACDC')
    @artist3 = Artist.new( 'id' =>3, 'name' => 'Adele')

    @artists = [ @artist1, @artist2, @artist3 ]


    @album1 = Album.new( 'id' =>1, 'title'=>'Kill Em All', 'artist_id'=> @artist1.id , 'sell_price'=>10)
    @album2 = Album.new( 'id' =>2, 'title'=>'Ride the Lightning', 'artist_id'=> @artist1.id, 'sell_price'=>9)
    @album3 = Album.new( 'id' =>3, 'title'=>'Reload', 'artist_id'=> @artist1.id, 'sell_price'=>15)
    @album4 = Album.new( 'id' =>4, 'title'=>'Ballbreaker', 'artist_id'=> @artist2.id, 'sell_price'=>10)
    @album5 = Album.new( 'id' =>5, 'title'=>'25', 'artist_id'=> @artist3.id, 'sell_price'=>15)

    @albums = [ @album1, @album2, @album3, @album4, @album5]


    @stock1 = Stock.new( 'album_id'=> @album1.id, 'quantity'=> 0 )
    @stock2 = Stock.new( 'album_id'=> @album2.id, 'quantity'=> 4 )
    @stock3 = Stock.new( 'album_id'=> @album3.id, 'quantity'=> 2 )
    @stock4 = Stock.new( 'album_id'=> @album5.id, 'quantity'=> 5 )
    

    @stocks = [ @stock1, @stock2, @stock3, @stock4 ]
     
    @account = Account.new(500)
     params = {
      'artists' => @artists,
      'albums' => @albums,
      'stocks' => @stocks,
      'account' => @account
    }

    
    @inventory = Inventory.new(params)
  end

  def test_artists
    expectation = ['Metallica', 'ACDC', 'Adele']
    assert_equal(expectation, @inventory.artists)
  end

  def test_account
    assert_equal(500, @inventory.account_balance)
  end

  def test_all_stocks
    expectation = {'Stock 1' => [1,0] , 
    'Stock 2' => [2,4] ,
    'Stock 3' => [3,2] ,
    'Stock 4' => [5,5] }
        
    assert_equal(expectation, @inventory.stocks)
  end

  def test_find_specific_stock_info_given_an_album_id
    assert_equal(@stock1, @inventory.stock_search(1))
  end
  
  def test_find_stock_album_info
    assert_equal(@album5, @inventory.stock_info(5))
  end

  def test_find_artist_for_stocked_album
    expectation = @artist1
    
    result = @inventory.artist_info(2)
    assert_equal(expectation, result)
  end

  def test_multiply_buy_price_by_a_given_quantity
    result = @inventory.total_buy_cost(@album4.buy_price, 5)
    assert_equal(25, result )
  end

  def test_takes_buy_cost_away_from_account
    result = @inventory.buy_transaction(@album4.buy_price, 5)
    assert_equal(475, result)
  end

  def test_return_stock_quantity
    result = @inventory.stock_quantity(5)
    assert_equal(5, result)
  end

  def test_add_stock_quantity
    result = @inventory.updated_quantity(5, 7)
    assert_equal(12, result)
  end

  def test_full_stock_search_for_updating
    result = @inventory.full_stock_search(5)
    expectation = {
      'album_title' => '25',
      'album_artist' => 'Adele', 
      'buy_price' => 5,
      'sell_price'=> 15,
      'current_quantity' => 5
    }
    assert_equal(expectation, result)
  end

  def test_return_updated_stock_item
    result = @inventory.buy_stock(5, 7)
    expectation = {'album_id'=> @album5.id, 'quantity'=> 12}
    assert_equal(expectation, result)
  end

  def test_above_method_works_with_different_album
    result = @inventory.buy_stock(3, 3)
    expectation = {'album_id'=> @album3.id, 'quantity'=> 5}
    assert_equal(expectation, result)
  end

  def test_returns_correct_error_message_if_album_not_in_stock
    result = @inventory.buy_stock(4, 3)
    expectation = "Album not stocked"
    assert_equal(expectation, result)
  end

  def test_total_revenue_from_sale
    result = @inventory.total_sell_amount(@album1.sell_price, 5)
    assert_equal(50, result)
  end

  def test_sale_amount_is_added_to_account
    result = @inventory.sell_transaction(@album1.sell_price, 5)
    assert_equal(550, result)
  end

  def test_sell_quantity_is_taken_from_stock_quantity
    result = @inventory.sell_quantity(5, 2)
    assert_equal(3, result)
  end

  def test_sell_stock
    result = @inventory.sell_stock(5, 2)
    expectation = { 'album_id' => @album5.id, 'quantity' => 3}
    assert_equal(expectation, result)
  end

  def test_inventory_can_calculate_markup_for_an_album
    result = @inventory.markup(4, 14)
    assert_equal(10, result)
  end

  def test_total_possible_revenue
    result = @inventory.total_revenue(14, 20)
    assert_equal(280, result)
  end


end