require('minitest/autorun')
require('minitest/rg')
require_relative('../models/account.rb')


class TestAccount < MiniTest::Test

  def setup
    @account = Account.new(500)
  end

  def test_balance
    assert_equal(500, @account.balance)
  end

  def test_add_to_balance
    assert_equal(523, @account.add(23))
  end

  def test_subtract_from_balance
    assert_equal(430, @account.take(70))
  end


end