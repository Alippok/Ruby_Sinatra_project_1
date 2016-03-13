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






end