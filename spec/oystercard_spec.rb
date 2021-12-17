# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:entry_station) }

  describe 'creating new oystercard' do
    it 'returns starting balance as default' do
      expect(subject.balance).to eq Oystercard::START_BALANCE
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
      expect { subject.top_up(50) }.to change { subject.balance }.from(0).to(50)
    end
  end

  describe 'top_up limit' do
    it 'returns error if balance exceeds limit on topup' do
      subject.balance = Oystercard::START_LIMIT
      expect { subject.top_up(1) }.to raise_error
    end

    it 'returns error message with limit on topup' do
      subject.balance = Oystercard::START_LIMIT
      expect { subject.top_up(1) }.to raise_error("Top up failed. Balance cannot exceed £#{subject.limit}.")
    end
  end

  describe '#touch_in' do
    it 'touch_in' do
      expect(subject).to respond_to(:touch_in).with(1).argument
    end
  end

  describe '#touch_out' do
    it 'touch_out' do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end
  end

  describe 'minimum balance for travel' do
    it 'when balance is less than £1, touch_in raises an exception' do
      subject.balance = Oystercard::MINIMUM_FARE - 1
      expect do
        subject.touch_in(:station)
      end.to raise_error("Touch in failed. Minimum balance of £#{Oystercard::MINIMUM_FARE} required.")
    end
  end

  describe 'debiting card' do
    it 'touch_out debits oystercard by minimum fare' do
      subject.balance = Oystercard::MINIMUM_FARE
      subject.touch_in(:entry_station)
      expect { subject.touch_out(:exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end

  describe '#touch_in && #touch_out' do
    it 'touching in and out stores a journey' do
      new_card = Oystercard.new
      new_card.balance = Oystercard::MINIMUM_FARE
      new_card.touch_in(:entry_station)
      new_card.touch_out(:exit_station)
      expect(new_card.history).to eq([{ entry_station: :entry_station, exit_station: :exit_station }])
    end
  end
end

#
#    deduct method no longer being tested as is private
# ========================================================
#
#   describe '#deduct' do
#     it 'respond_to deduct' do
#       expect(subject).to respond_to(:deduct).with(1).argument
#     end
#
#     it 'deducts amount' do
#       subject.balance = 10
#       expect{ subject.deduct(10) }.to change{ subject.balance }.from(10).to(0)
#     end
#   end
#
#    store_journey method no longer being tested as is private
# ===============================================================
#
#   describe '#store_journey' do
#     it 'responds to store_journey' do
#       expect(subject).to respond_to(:store_journey)
#     end
#
#     it 'stores journey in history' do
#       subject.journey = {:entry_station => :station, :exit_station => :station}
#       subject.store_journey
#       expect(subject.history).to eq([subject.journey])
#     end
#   end
#