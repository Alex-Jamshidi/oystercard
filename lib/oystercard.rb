# frozen_string_literal: true

require_relative 'station'
require_relative 'journey'

# This is my Oystercard class
class Oystercard
  attr_accessor :balance, :limit, :history, :journey

  START_BALANCE = 0
  START_LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = START_BALANCE
    @limit = START_LIMIT
    @history = []
    @journey = Journey.new
  end

  # adds amount of money to oystercard
  def top_up(amount)
    raise("Top up failed. Balance cannot exceed £#{limit}.") unless (balance + amount) <= limit

    @balance += amount
    puts "Top-up successful, £#{amount} added, New balance: £#{@balance}"
  end

  # touches oystercard in at station
  def touch_in(entry_station)
    raise("Touch in failed. Minimum balance of £#{MINIMUM_FARE} required.") unless balance >= MINIMUM_FARE

    @journey.start_journey(entry_station)
    puts "Touch-in successful"
  end

  # touches oystercard out at station
  def touch_out(exit_station)
    @journey.finish_journey(exit_station)
    puts "Touch-out successful"

    deduct(@journey.fare)
    store_journey
  end

  # private method: deducts amount of money from oystercard
  def deduct(amount)
    @balance -= amount
    puts "Deducted £#{amount}, New Balance: £#{@balance}"
  end

  # private method: stores current journey in history
  def store_journey
    puts "Journey: #{@journey.temp_history} stored in history."
    @history += @journey.temp_history.dup
  end

  private :deduct, :store_journey

end