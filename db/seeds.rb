require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/stock.rb')
require('pry-byebug')

Stock.delete_all
Album.delete_all
Artist.delete_all


@artist1 = Artist.create( 'name' => 'Metallica')
@artist2 = Artist.create( 'name' => 'ACDC')
@artist3 = Artist.create( 'name' => 'Adele')

@album1 = Album.create( 'title'=>'Kill Em All', 'artist_id'=> @artist1.id , 'buy_price'=>6, 'sell_price'=>10)
@album2 = Album.create( 'title'=>'Ride the Lightning', 'artist_id'=> @artist1.id, 'buy_price'=>4, 'sell_price'=>9)
@album3 = Album.create( 'title'=>'Reload', 'artist_id'=> @artist1.id, 'buy_price'=>8, 'sell_price'=>15)
@album4 = Album.create( 'title'=>'Ballbreaker', 'artist_id'=> @artist2.id, 'buy_price'=>3, 'sell_price'=>10)
@album5 = Album.create( 'title'=>'25', 'artist_id'=> @artist3.id, 'buy_price'=>3, 'sell_price'=>15)


@stock1 = Stock.create( 'album_id'=> @album1.id, 'quantity'=> 0 )
@stock2 = Stock.create( 'album_id'=> @album2.id, 'quantity'=> 0 ) 
@stock3 = Stock.create( 'album_id'=> @album4.id, 'quantity'=> 0 )
@stock4 = Stock.create( 'album_id'=> @album5.id, 'quantity'=> 0 )







