# Exercise 1: Bank Account

class BankAccount
  attr_accessor :balance, :interest_rate

  def initialize(balance, interest_rate)
    @balance = balance
    @interest_rate = interest_rate
  end

  # an instance method called deposit that accepts one amount argument
  # and adds that amount to the total balance
  def deposit(amount)
    @balance += amount
  end

  # withdraw instance method that accepts one amount argument
  # and subtracts it from the total balance
  def withdraw(amount)
    @balance -= amount
  end

  # gain_interest instance method
  # that increases the total balance according to the interest rate.
  def gain_interest
    @balance *= (1 + @interest_rate)
  end
end

t = BankAccount.new(1000, 0.5)
t.deposit(200)
t.withdraw(50)
p t.balance
t.gain_interest
p t.balance
