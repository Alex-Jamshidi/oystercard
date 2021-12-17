# frozen_string_literal: true

require_relative 'oystercard'
require_relative 'station'

# This is my Oystercard class
class Journey

attr_accessor :journey, :fare, :temp_history

PENALTY_FARE = 6

  def initialize
    @journey = {}
    @temp_history = []
    @fare = 0
  end

  # checks if currently in a journey
  def in_journey?
    !!@journey[:entry_station] && !@journey[:exit_station]
  end

  # private method: clears journey values
  def clear_journey
    @journey[:entry_station] = nil
    @journey[:exit_station] = nil
    puts "Journey now cleared: #{journey}"
  end

  # starts journey when given station (adds penalty if already in journey)
  def start_journey(entry_station)
    calculate_fare if self.in_journey?
    @journey[:entry_station] = entry_station
    
    puts "Journey started. Entry station: #{@journey[:entry_station]}"
  end

  # completes journey; assigning fares
  def finish_journey(exit_station)
    @journey[:exit_station] = exit_station
  
    puts "Journey finished. Exit station: #{@journey[:exit_station]}"
    calculate_fare
  end
  
  # calculates fare for journey
  def calculate_fare
    if complete?
      @fare += Oystercard::MINIMUM_FARE
      puts "Fare amount: £#{Oystercard::MINIMUM_FARE}"
    else
      @fare += PENALTY_FARE
      puts "Incomplete journey: £#{PENALTY_FARE}"
    end
    store_journey
  end

  # checks if journey is complete
  def complete?
    !!@journey[:entry_station] && !!@journey[:exit_station]
  end

   # stores journeys in a temporary history
  def store_journey
    puts "Journey: #{@journey} stored in temporary history."
    @temp_history << @journey.dup
    clear_journey
  end

private :clear_journey

end