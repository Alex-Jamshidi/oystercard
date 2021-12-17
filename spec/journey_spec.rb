# frozen_string_literal: true

require 'journey'

describe Journey do
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:entry_station) }

  let(:alt_entry_station) { double(:alt_entry_station) }
  let(:alt_exit_station) { double(:alt_exit_station) }

  let(:completed_journey){ { :entry_station => :entry_station, :exit_station => :exit_station } }
  let(:started_journey){ { :entry_station => :entry_station } }

  describe '#intialize' do
    it 'journey is empty' do
      expect(subject.journey).to be_empty
    end

    it 'temp_history is empty' do
      expect(subject.temp_history).to be_empty
    end

    it 'fare is 0' do
      expect(subject.fare).to eq 0
    end
  end

  describe '#in_journey?' do
    it 'respond to in_journey?' do
      expect(subject).to respond_to(:in_journey?)
    end

    it 'true when in journey' do
      subject.journey = started_journey
      expect(subject.in_journey?).to eq true
    end

    it 'false when journey complete' do
      subject.journey = completed_journey
      expect(subject.in_journey?).to eq false
    end

    it 'false when journey empty' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#start_journey' do
    it 'responds with argument' do
      expect(subject).to respond_to(:start_journey).with(1).argument
    end

    it 'journey key entry_station will accept a station' do
      subject.start_journey(:entry_station)
      expect(subject.journey[:entry_station]).to eq(:entry_station)
    end

    it 'journey key entry_station will replace station if ran when another journey already started' do
      subject.journey = started_journey
      subject.start_journey(:alt_entry_station)
      expect(subject.journey[:entry_station]).to eq(:alt_entry_station)
    end

    it 'increased fare by penalty_charge if already touched_in to journey at a different station' do
      subject.journey = started_journey
      expect{ subject.start_journey(:alt_entry_station) }.to change { subject.fare }.by(Journey::PENALTY_FARE)
    end
  end

  describe '#finish_journey' do
    it 'responds with argument' do
      expect(subject).to respond_to(:finish_journey).with(1).argument
    end
  end

  describe '#calculate_fare' do
    it 'responds' do
      expect(subject).to respond_to(:calculate_fare)
    end
  end

  describe '#complete?' do
    it 'responds' do
      expect(subject).to respond_to(:complete?)
    end

    it 'true if journey complete' do
      subject.journey = completed_journey
      expect(subject.complete?).to eq true
    end

    it 'false if journey missing exit_station' do
      subject.journey = started_journey
      expect(subject.complete?).to eq false
    end
  end

  describe '#store_journey' do
    it 'respond to store_journey?' do
      expect(subject).to respond_to(:store_journey)
    end
    
    it 'journey stored in temp_history' do
      subject.journey = completed_journey.dup
      subject.store_journey
      expect(subject.temp_history).to eq [completed_journey]
    end
  end

end

#    clear_journey method no longer being tested as is private
# ===============================================================
#
#   describe '#clear_journey' do
#     let(:journey){ { :entry_station => :entry_station, :exit_station => :exit_station } }
#
#     it 'clears journey to nil values' do
#       subject.journey = journey
#       subject.clear_journey
#       expect(subject.journey[0]).to be_nil
#       expect(subject.journey[1]).to be_nil
#     end
#   end
#
