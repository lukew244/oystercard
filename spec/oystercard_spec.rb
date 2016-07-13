require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  let(:max_balance) {Oystercard::MAXIMUM_BALANCE}
  let(:min_fare) {Oystercard::MINIMUM_FARE}
  let(:station) {double :station}

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
      message = "Cannot top-up: exceeds maximum balance of #{max_balance}"
      expect { card.top_up(1) }.to raise_error message
    end

  end

  describe "#deduct" do

    it "can deduct a fare" do
      card.top_up(50)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.balance).to eq 49
    end

  end

  describe "#in_journey?" do
    before do
      card.top_up(1)
    end

    it "is initially not in journey" do
      expect(card.journey).to be_empty
    end

    it "can touch in" do
      card.touch_in(station)
      expect(card).to be_in_journey
    end

    it "can touch out" do
      card.touch_in(station)
      card.touch_out(station)
      expect(card).not_to be_in_journey
    end

    it 'deducts minimum fare when touch out' do
      card.touch_in(station)
      expect{ card.touch_out(station) }.to change { card.balance }.by -min_fare
    end

  context 'when balance is too low' do
    it "touch in raises error" do
      card.touch_in(station)
      card.touch_out(station)
      message = "Cannot touch in: balance is too low"
      expect{ card.touch_in(station) }.to raise_error message
    end
  end


  end

  describe "#history" do
    let(:station1) {double :station}
    let(:station2) {double :station}

    before do
      card.top_up(1)
      card.touch_in(station1)
    end

    it 'can display journey' do
      card.touch_out(station2)
      expect(card.journey).to eq [{:entry_station => station1, :exit_station => station2}]
      
    end

  end



end
