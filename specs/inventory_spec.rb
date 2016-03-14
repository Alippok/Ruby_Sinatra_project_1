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


    @album1 = Album.new( 'id' =>1, 'title'=>'Kill Em All', 'artist_id'=> @artist1.id , 'buy_price'=>6, 'sell_price'=>10)
    @album2 = Album.new( 'id' =>2, 'title'=>'Ride the Lightning', 'artist_id'=> @artist1.id, 'buy_price'=>4, 'sell_price'=>9)
    @album3 = Album.new( 'id' =>3, 'title'=>'Reload', 'artist_id'=> @artist1.id, 'buy_price'=>8, 'sell_price'=>15)
    @album4 = Album.new( 'id' =>4, 'title'=>'Ballbreaker', 'artist_id'=> @artist2.id, 'buy_price'=>3, 'sell_price'=>10)
    @album5 = Album.new( 'id' =>5, 'title'=>'25', 'artist_id'=> @artist3.id, 'buy_price'=>3, 'sell_price'=>15)

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



end