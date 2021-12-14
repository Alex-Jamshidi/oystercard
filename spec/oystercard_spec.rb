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
      expect(subject.top_up(50)).to eq 50 
    end 

    it 'adds any value to oystercard' do
      amount = rand(100)
      expect(subject.top_up(amount)).to eq amount 
    end 

  describe "top_up limit" do
    it "returns error if balance is on topup" do
      new_card = Oystercard.new(91)
      expect{new_card.top_up(0)}.to raise_error
    end

    it "returns error message with limit on topup" do
      new_card = Oystercard.new(91)
      LIMIT = 90
      expect{new_card.top_up(0)}.to raise_error("Balance cannot exceed £#{LIMIT}.")
    end



   # it "returns error if top_up would cause balance to exceed 90"
   #   expect()
      
  end





  end 


end