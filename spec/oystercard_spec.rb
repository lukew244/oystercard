require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe "#balance" do
    it 'has a starting value of 0' do
      expect(card.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it 'can be topped up' do
      expect{ card.top_up(5) }.to change{ card.balance }.by 5
      expect{ card.top_up(1) }.to eq(6)
    end
  end


end
