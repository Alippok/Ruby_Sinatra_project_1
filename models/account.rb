class Account

  attr_reader(:balance)

  def initialize(balance)
    @balance = balance
  end

  def add(amount)
     return @balance += amount
  end

  def take(amount) 
    return @balance -= amount
  end









end