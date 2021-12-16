require 'station'

describe Station do
  describe '#initialize' do
    it 'new instance will return zone' do
      bank = Station.new("Bank")
      expect(bank.zone).to be_a_kind_of(Integer)
    end

    it 'return error if station name does not exist in directory' do
      expect{ Station.new("not_a_station") }.to raise_error("Station name does not exist")
    end
  end
end