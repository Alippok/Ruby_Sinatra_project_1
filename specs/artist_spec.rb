require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist.rb')
require_relative('../db/sql_runner.rb')


class TestArtist < MiniTest::Test


  def setup
    @artist = Artist.new( 'name' => 'Metallica' )

  end

  def test_name
    assert_equal("Metallica", @artist.name)
  end

  



end