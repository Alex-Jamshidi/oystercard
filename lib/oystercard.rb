# This is my Oystercard class
class Oystercard

  attr_accessor :balance, :in_transit
  attr_reader :limit

  def initialize(balance = 0, limit = 90, in_transit = false)
    @balance = balance
    @limit = limit
    @in_transit = in_transit
    puts "You have created a new oyster card with balance: #{balance}, limit: #{limit}"
  end

  def top_up(amount)
    unless (balance + amount) <= limit then fail("Balance cannot exceed £#{limit}.") end
      @balance += amount
  end 

  def deduct(amount)
    @balance -= amount
  end 
  
  def in_journey?
    @in_transit ? true : false
  end

  def touch_in
    @in_transit = true
  end

  def touch_out
    @in_transit = false
  end
  
end