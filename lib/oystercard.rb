# This is my Oystercard class
class Oystercard

# BALANCE = 0
  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  attr_reader :balance

  def top_up(amount)
  unless (balance + amount) <= 90 then fail("Balance cannot exceed £#{LIMIT}.") end
  @balance =+ amount
  end 

end