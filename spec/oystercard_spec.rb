require 'oystercard'

describe Oystercard do

  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:entry_station) }

  describe 'creating new oystercard' do 
    it 'returns starting balance as default' do
      expect(subject.balance).to eq Oystercard::START_BALANCE
    end

    it 'new oystercard journey is empty' do
      expect(subject.journey).to be_empty
    end

    it 'new oystercard history is empty' do
      expect(subject.history).to be_empty
    end
  end 

  describe '#top_up' do
    it 'responds to topping up' do 
      expect(subject).to respond_to(:top_up)
    end 
   
    it 'adds 50 value to oystercard' do
      subject.balance = 0
      expect{ subject.top_up(50) }.to change { subject.balance }.from(0).to(50)
    end 
  end

  describe 'top_up limit' do
    it 'returns error if balance exceeds limit on topup' do
      subject.balance = Oystercard::START_LIMIT 
      expect{subject.top_up(1)}.to raise_error

    end
    
    it 'returns error message with limit on topup' do
      subject.balance = Oystercard::START_LIMIT
      expect{subject.top_up(1)}.to raise_error("Top up failed. Balance cannot exceed £#{subject.limit}.")
    end
  end

  describe '#in_journey?' do
    it 'respond_to in_journey?' do
      expect(subject).to respond_to(:in_journey?)
    end

    it 'check if in journey when in journey' do
      subject.journey[:entry_station] = :entry_station
      expect(subject.in_journey?).to eq true
    end

    it 'check if in journey when not in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'touch_in' do
      expect(subject).to respond_to(:touch_in).with(1).argument 
    end 

    it 'the journey key entry_station will accept a station' do
      subject.balance = Oystercard::MINIMUM_FARE
      subject.touch_in(:entry_station)
      expect(subject.journey[:entry_station]).to eq(:entry_station)
    end

    it 'journey start value will equal entry_station' do
      subject.balance = Oystercard::MINIMUM_FARE
      subject.touch_in(:entry_station)
      expect(subject.journey[:entry_station]).to eq :entry_station
    end
  end

  describe '#touch_out' do
    it 'touch_out' do
      expect(subject).to respond_to(:touch_out).with(1).argument 
    end 

    it 'entry_station is set to nil' do
      subject.journey[:entry_station] = :entry_station
      subject.balance = Oystercard::MINIMUM_FARE
      subject.touch_out(:exit_station)
      expect(subject.journey[:entry_station]).to eq(nil)
    end

    it 'journey[0] in history exit value will equal exit_station' do
      subject.balance = Oystercard::MINIMUM_FARE
      subject.journey[:entry_station] = :entry_station
      subject.touch_out(:exit_station)
      expect(subject.history[0][:exit_station]).to eq :exit_station
    end
  end

  describe 'minimum balance for travel' do
    it 'when balance is less than £1, touch_in raises an exception' do
      subject.balance = Oystercard::MINIMUM_FARE - 1
      expect{ subject.touch_in(:station) }.to raise_error("Touch in failed. Minimum balance of #{Oystercard::MINIMUM_FARE} required.")
    end
  end

  describe 'debiting card' do
    it 'touch_out debits oystercard by minimum fare' do
      subject.balance = Oystercard::MINIMUM_FARE
      expect{subject.touch_out(:station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end
  end


  describe '#touch_in && #touch_out' do
    it 'touching in and out stores a journey' do
      subject.balance = Oystercard::MINIMUM_FARE
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.history).to eq([{:entry_station => :station, :exit_station => :station}])
    end 
  end
end

=begin

   deduct method no longer being tested as is private
========================================================

  describe '#deduct' do
    it 'respond_to deduct' do
      expect(subject).to respond_to(:deduct).with(1).argument
    end

    it 'deducts amount' do
      subject.balance = 10
      expect{ subject.deduct(10) }.to change{ subject.balance }.from(10).to(0)
    end
  end 

   store_journey method no longer being tested as is private
===============================================================

  describe '#store_journey' do
    it 'responds to store_journey' do 
      expect(subject).to respond_to(:store_journey)
    end 

    it 'stores journey in history' do
      subject.journey = {:entry_station => :station, :exit_station => :station}
      subject.store_journey
      expect(subject.history).to eq([subject.journey])
    end
  end

   clear_journey method no longer being tested as is private
===============================================================

  describe '#clear_journey' do
    let(:journey){ { :entry_station => :entry_station, :exit_station => :exit_station } }
    
    it 'clears journey to nil values' do
      subject.journey = journey
      subject.clear_journey
      expect(subject.journey[0]).to be_nil
      expect(subject.journey[1]).to be_nil
    end
  end

=end