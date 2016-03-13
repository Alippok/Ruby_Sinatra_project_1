require('minitest/autorun')
require('minitest/rg')
require_relative('../models/stock.rb')


class TestStock < MiniTest::Test


  def setup
    @stock1 = Stock.new('artist_id'=> 3, 'album_id'=> 7)
  end

  def test_quantity
    assert_equal(0, @stock1.quantity)
  end


  






end