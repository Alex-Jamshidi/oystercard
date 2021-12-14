# This is my Oystercard class
class Oystercard

  attr_accessor :balance, :in_transit
  attr_reader :limit

  START_BALANCE = 0
  START_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = START_BALANCE, limit = START_LIMIT, in_transit = false)
    @balance = balance
    @limit = limit
    @in_transit = in_transit
  end

  def top_up(amount)
    unless (balance + amount) <= limit then fail("Balance cannot exceed £#{limit}.") end
      @balance += amount
  end 
  
  def in_journey?
    @in_transit ? true : false
  end

  def touch_in
    raise("Touch in failed. Balance exceeds minimum amount.") unless balance >= 1
    @in_transit = true
  end

  def touch_out
    @in_transit = false
    deduct(MINIMUM_FARE)
  end

  def deduct(amount)
    @balance -= amount
  end 

  private :deduct

end