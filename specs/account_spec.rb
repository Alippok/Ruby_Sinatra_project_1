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





end