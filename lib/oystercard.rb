# This is my Oystercard class
class Oystercard

  attr_accessor :balance, :entry_station, :limit, :journey

  START_BALANCE = 0
  START_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = START_BALANCE
    @limit = START_LIMIT
    @entry_station = nil
    @journey = {}
    @history = []

  end

  def top_up(amount)
    fail("Top up failed. Balance cannot exceed £#{limit}.") unless (balance + amount) <= limit
    @balance += amount
  end 
  
  def in_journey?
    #can be !!entry_station 
    @entry_station? true : false
  end

  def touch_in(entry_station)
    raise("Touch in failed. Minimum balance of #{MINIMUM_FARE} required.") unless balance >= MINIMUM_FARE
    @entry_station = entry_station
    @journey = {:entry_station => entry_station}
  end

  def touch_out(exit_station)
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end 

  def deduct(amount)
    @balance -= amount
  end 

  private :deduct

end