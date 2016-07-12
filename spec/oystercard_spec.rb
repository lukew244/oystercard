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
      expect(card.top_up(1)).to eq(6)
    end

    it 'creates error when maximum balance exceeded' do
      card.top_up(described_class::DEFAULT_MAXIMUM)
      expect {card.top_up(1)}.to raise_error "maximum balance reached"
    end

  end


end
