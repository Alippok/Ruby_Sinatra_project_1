require('minitest/autorun')
require('minitest/rg')
require_relative('../models/album.rb')


class TestAlbum < MiniTest::Test


  def setup
    @album1 = Album.new( 'title'=>'Kill Em All','artist_id'=>1,'buy_price'=>5, 'sell_price'=>10 )

  end

  def test_title
    assert_equal('Kill Em All', @album1.title)
  end






end