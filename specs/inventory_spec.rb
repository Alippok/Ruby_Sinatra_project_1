require('minitest/autorun')
require('minitest/rg')
require_relative('../models/inventory.rb')
require_relative('../models/stock.rb')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')


class TestInventory < MiniTest::Test


  def setup
    @artist1 = Artist.new( 'name' => 'Metallica')
    @artist2 = Artist.new( 'name' => 'ACDC')
    @artist3 = Artist.new( 'name' => 'Adele')

    @artists = [ @artist1, @artist2, @artist3 ]


    @album1 = Album.new( 'title'=>'Kill Em All', 'artist_id'=> @artist1.id , 'buy_price'=>6, 'sell_price'=>10)
    @album2 = Album.new( 'title'=>'Ride the Lightning', 'artist_id'=> @artist1.id, 'buy_price'=>4, 'sell_price'=>9)
    @album3 = Album.new( 'title'=>'Reload', 'artist_id'=> @artist1.id, 'buy_price'=>8, 'sell_price'=>15)
    @album4 = Album.new( 'title'=>'Ballbreaker', 'artist_id'=> @artist2.id, 'buy_price'=>3, 'sell_price'=>10)
    @album5 = Album.new( 'title'=>'25', 'artist_id'=> @artist3.id, 'buy_price'=>3, 'sell_price'=>15)

    @albums = [ @album1, @album2, @album3, @album4, @album5]


    @stock1 = Stock.new( 'album_id'=> @album1.id, 'quantity'=> 0 )
    

    @stocks = [ @stock1, @stock2, @stock3, @stock4 ]
     
     params = {
      'artists' => @artists,
      'albums' => @albums,
      'stocks' => @stocks
    }
    
    @inventory = Inventory.new(params)
  end

  def test_artists
    expectation = ['Metallica', 'ACDC', 'Adele']
    assert_equal(expectation, @inventory.artists)
  end







end