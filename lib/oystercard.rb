require_relative 'station'

# This is my Oystercard class
class Oystercard

  attr_accessor :balance, :limit, :journey, :history

  START_BALANCE = 0
  START_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = START_BALANCE
    @limit = START_LIMIT
    @journey = {}
    @history = []

  end

  # adds amount of money to oystercard
  def top_up(amount)
    fail("Top up failed. Balance cannot exceed £#{limit}.") unless (balance + amount) <= limit
    @balance += amount
    puts "Top-up successful, #{amount} added, New balance: #{@balance}"
  end 
  
  # checks if oystercard has touched in but not out
  def in_journey?
    !!@journey[:entry_station]
  end

  # touches oystercard in at station
  def touch_in(entry_station)
    raise("Touch in failed. Minimum balance of #{MINIMUM_FARE} required.") unless balance >= MINIMUM_FARE
 
    @journey = {:entry_station => entry_station}
    puts "Touch-in successful, Journey updated: #{@journey}"
  end

  # touches oystercard out at station
  def touch_out(exit_station)
    @journey[:exit_station] = exit_station
    puts "Touch-out successful, Journey updated: #{@journey}"

    deduct(MINIMUM_FARE)
    store_journey
    clear_journey
  end 

  # private method: deducts amount of money from oystercard
  def deduct(amount)
    @balance-= amount
    puts "Deducted #{amount}, New Balance: #{@balance}"
  end 

  # private method: stores current journey in history
  def store_journey
    puts "Journey: #{@journey} stored in history."
    @history << @journey.dup
  end

  # private method: clears journey values
  def clear_journey
    @journey[:entry_station] = nil
    @journey[:exit_station] = nil
    puts "Journey now cleared: #{journey}"
  end

  private :deduct, :store_journey, :clear_journey

end