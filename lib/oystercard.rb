# This is my Oystercard class
class Oystercard

  attr_accessor :balance
  attr_reader :limit

  def initialize(balance = 0, limit = 90)
    @balance = balance
    @limit = limit
  end

  def top_up(amount)
    unless (balance + amount) <= limit then fail("Balance cannot exceed £#{limit}.") end
      @balance += amount
  end 

  def deduct(amount)
    @balance -= amount
  end 

end