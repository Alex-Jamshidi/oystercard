# frozen_string_literal: true

require 'station'

describe Station do
  describe '#initialize' do
    subject { described_class.new('Bank') }

    it 'knows its name' do
      expect(subject.name).to eq('Bank')
    end

    it 'will return zone' do
      expect(subject.zone).to be_a_kind_of(Integer)
    end

    it 'return error if station name does not exist in directory' do
      expect { Station.new('not_a_station') }.to raise_error('Station name does not exist')
    end
  end
end
