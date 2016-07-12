require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  let(:max_balance) {Oystercard::MAXIMUM_BALANCE}
  let(:min_fare) {Oystercard::MINIMUM_FARE}

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
      card.top_up(max_balance)
      message = "You have reached your maximum allowance of #{max_balance}"
      expect { card.top_up(1) }.to raise_error message
    end

  end

  describe "#deduct" do

    it "can deduct a fare" do
      card.top_up(50)
      10.times {card.touch_out}
      expect(card.balance).to eq 40
    end

  end

  describe "#in_journey?" do
    before do
      card.top_up(1)
    end

    it "is initially not in journey" do
      expect(card).not_to be_in_journey
    end

    it "can touch in" do
      card.touch_in
      expect(card).to be_in_journey
    end

    it "can touch out" do
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it 'deducts minimum fare when touch out' do
      card.touch_in
      expect{ card.touch_out }.to change { card.balance }.by -min_fare
    end


    it "raises error when not enough funds to touch in" do
      card.touch_out
      expect{ card.touch_in }.to raise_error "Not enough funds"
    end
  end




end
