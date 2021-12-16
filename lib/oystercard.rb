require_relative 'station'

# This is my Oystercard class
class Oystercard

  attr_accessor :balance, :entry_station, :limit, :journey, :history

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

  # adds amount of money to oystercard
  def top_up(amount)
    fail("Top up failed. Balance cannot exceed £#{limit}.") unless (balance + amount) <= limit
    @balance += amount
    puts "Top-up successful, #{amount} added, New balance: #{@balance}"
    @balance
  end 
  
  # checks if oystercard has touched in but not out
  def in_journey?
    @entry_station? true : false
    # optional syntax: !!entry_station 
  end

  # touches oystercard in at station
  def touch_in(entry_station)
    raise("Touch in failed. Minimum balance of #{MINIMUM_FARE} required.") unless balance >= MINIMUM_FARE
    @entry_station = entry_station
    
    @journey = {:entry_station => entry_station}
    puts "Touch-in successful, Journey updated: #{@journey}"
    @journey
  end

  # touches oystercard out at station
  def touch_out(exit_station)
    @entry_station = nil
    @journey[:exit_station] = exit_station
    puts "Touch-out successful, Journey updated: #{@journey}"

    deduct(MINIMUM_FARE)
    store_journey
  end 

  # private method: deducts amount of money from oystercard
  def deduct(amount)
    @balance-= amount
    puts "Deducted #{amount}, New Balance: #{@balance}"
    @balance
  end 

  # private method: stores current journey in history
  def store_journey
    puts "Journey: #{@journey} stored in history."
    @history << @journey
  end

  private :deduct, :store_journey

end