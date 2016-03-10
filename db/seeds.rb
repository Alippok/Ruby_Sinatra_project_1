require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/stock.rb')

Artist.delete_all

@artist = Artist.create( 'name' => 'Metallica')



