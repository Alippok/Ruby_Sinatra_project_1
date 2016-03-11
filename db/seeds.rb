require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/stock.rb')
require('pry-byebug')

Album.delete_all
Artist.delete_all


@artist1 = Artist.create( 'name' => 'Metallica')
@artist2 = Artist.create( 'name' => 'ACDC')
@artist3 = Artist.create( 'name' => 'Adele')

@album1 = Album.create( 'title'=>'Kill Em All', 'artist_id'=> 19, 'buy_price'=>6, 'sell_price'=>10)
@album2 = Album.create( 'title'=>'Ride the Lightning', 'artist_id'=> 19, 'buy_price'=>4, 'sell_price'=>9)
@album3 = Album.create( 'title'=>'Reload', 'artist_id'=> 19, 'buy_price'=>8, 'sell_price'=>15)
@album4 = Album.create( 'title'=>'Ballbreaker', 'artist_id'=> 20, 'buy_price'=>3, 'sell_price'=>10)
@album5 = Album.create( 'title'=>'25', 'artist_id'=> 21, 'buy_price'=>3, 'sell_price'=>15)

binding.pry
nil


