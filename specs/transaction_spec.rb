require('minitest/autorun')
require('minitest/rg')
require_relative('../models/transaction.rb')
require_relative('../models/stock.rb')
# require_relative('../models/album.rb')
# require_relative('../models/artist.rb')


class TestTransaction < MiniTest::Test

  
  def setup
    @artist1 = Artist.new( 'name' => 'Metallica')
    @artist2 = Artist.new( 'name' => 'ACDC')
    @artist3 = Artist.new( 'name' => 'Adele')

    # @artists = [ @artist1, @artist2, @artist3 ]


    @album1 = Album.new( 'title'=>'Kill Em All', 'artist_id'=> @artist1.id , 'buy_price'=>6, 'sell_price'=>10)
    @album2 = Album.new( 'title'=>'Ride the Lightning', 'artist_id'=> @artist1.id, 'buy_price'=>4, 'sell_price'=>9)
    @album3 = Album.new( 'title'=>'Reload', 'artist_id'=> @artist1.id, 'buy_price'=>8, 'sell_price'=>15)
    @album4 = Album.new( 'title'=>'Ballbreaker', 'artist_id'=> @artist2.id, 'buy_price'=>3, 'sell_price'=>10)
    @album5 = Album.new( 'title'=>'25', 'artist_id'=> @artist3.id, 'buy_price'=>3, 'sell_price'=>15)

    # @albums = [ @album1, @album2, @album3, @album4, @album5]


    @stock1 = Stock.new( 'album_id'=> @album1.id, 'quantity'=> 0 )
    

    # @stocks = [ @stock1, @stock2, @stock3, @stock4 ]
     
     params = {
      'artist' => @artist1,
      'album' => @album1,
      'stock' => @stock1
     }
     #So when user wants to complete a transaction, a new transaction shoudl include: 
     #the artist involved, the album and its info(title, price etc) and the stock object itself
     #This info comes from the controller and what methods and actions I place in the '/
     #transaction/new' and 'transaction/create' routes to collect all the info needed for the
     #transaction to take place. The create transaction is pretty much complete-transaction
     #and would update the stock quantity, +- amount from account etc. The Transaction model
     #does not need an update etc but could possibly contain a record of transactions in a 
     #separate table which would allow the user to record and search a history of their 
     #transactions. CREATE A TRANSACTION DATABASE TABLE!

    @transaction = Transaction.new(params)

  end

  def test_account
    assert_equal(500, @transaction.account)
  end










end