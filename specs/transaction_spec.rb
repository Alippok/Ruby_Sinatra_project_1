require('minitest/autorun')
require('minitest/rg')
require_relative('../models/transaction.rb')
require_relative('../models/stock.rb')
# require_relative('../models/album.rb')
# require_relative('../models/artist.rb')


class TestTransaction < MiniTest::Test

  
  def setup
  
    @transaction = Transaction.new

  end

  def test_account
    assert_equal(500, @transaction.account)
  end










end