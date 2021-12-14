require "oystercard"

# Given
# When
# Then

describe Oystercard do

  describe "creating new oystercard" do 
    it "returns 0 balance as default" do
      expect(subject.balance).to eq 0
    end

    it "returns 50 balance when given argument 50" do
      new_card = Oystercard.new(50)
      expect(new_card.balance).to eq 50
    end
  end 

  describe "#top_up" do
    it "responds to topping up" do 
      expect(subject).to respond_to(:top_up)
    end 
   
    it 'adds 50 value to oystercard' do
      subject.balance = 0
      expect{ subject.top_up(50) }.to change { subject.balance }.from(0).to(50)
    end 
  end

  describe "top_up limit" do
    it "returns error if balance is on topup" do
      new_card = Oystercard.new(80, 90)
      expect{new_card.top_up(11)}.to raise_error
    end

    it "returns error message with limit on topup" do
      new_card = Oystercard.new(80, 90)
      limit = new_card.limit
      expect{new_card.top_up(11)}.to raise_error("Balance cannot exceed £#{limit}.")
    end

    describe '#deduct' do
      it 'respond_to deduct' do
        expect(subject).to respond_to(:deduct).with(1).argument
      end

      it 'deducts amount' do
        subject.balance = 10
        expect{ subject.deduct(10) }.to change{ subject.balance }.from(10).to(0)
      end

    end 
  
  end 
end
