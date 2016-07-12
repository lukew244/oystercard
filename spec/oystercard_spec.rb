require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe "#balance" do
    it 'has a starting value of 0' do
      expect(card.balance).to eq 0
    end
  end

  describe "#top_up" do
    it 'can be topped up' do
      expect{ card.top_up(5) }.to change{ card.balance }.by 5
      expect(card.top_up(1)).to eq 6
    end

    it 'creates error when maximum balance exceeded' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      card.top_up(max_balance)
      message = "You have reached your maximum allowance of #{max_balance}"
      expect { card.top_up(1) }.to raise_error message
    end

  end

  describe "#deduct" do

    it "can deduct a fare" do
      card.top_up(50)
      expect { card.deduct(10) }.to change { card.balance }.by -10
      expect(card.balance).to eq 40
    end

  end

end
