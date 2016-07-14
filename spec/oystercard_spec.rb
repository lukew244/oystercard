require 'oystercard'

describe Oystercard do
  subject { described_class.new }



  let(:card_with_money) { described_class.new }
  before(:each) { card_with_money.top_up(Oystercard::MAX_BALANCE) } #any reference to card_with_money will have its balance full
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }
  let(:journey) { double(:journey) }


  max_balance = Oystercard::MAX_BALANCE
  min_amount = Oystercard::MIN_AMOUNT
  min_fare = Oystercard::MIN_FARE

  describe 'initialize'do
    it 'has a balance of zero' do
      expect(subject.balance).to(eq(0))
    end

    it 'has an empty list of journeys by default' do
      expect(subject.journey_log).to be_empty
    end

  end

  describe '#top_up' do
    context '#top_up should:' do
      it 'top up balance by minimum amount' do
        expect{ subject.top_up(min_amount) }.to change{ subject.balance }.by(min_amount)
      end

      it 'not top up if max balance exceeded' do
        subject.top_up(max_balance)
        expect{ subject.top_up(min_amount) }.to(raise_error("Maximum balance of £#{max_balance} exceeded"))
      end
    end
  end

  describe '#touch_in' do

      it 'raise error if card does not have minimum amount' do
        expect{ subject.touch_in(entry_station) }.to(raise_error("Card needs at least £#{min_amount} to touch in"))
      end


  end

  describe '#touch_out' do

    it 'deducts minimum fare from balance' do
      expect{ card_with_money.touch_out(exit_station) }.to change{ card_with_money.balance }.by(-min_fare)
    end


    describe 'after journey' do
      it 'journey log should contain journey' do
        card_with_money.touch_in(entry_station)
        card_with_money.touch_out(exit_station)
        expect(card_with_money.journey_log).to include({:entry_station => entry_station, :exit_station => exit_station})

      end

    end


  end

  # describe '#journey' do
  #
  #   let(:journey) { {entry_station: entry_station, exit_station: exit_station} }
  #   it 'stores a journey' do
  #     card_with_money.touch_in(entry_station)
  #     card_with_money.touch_out(exit_station)
  #     expect(card_with_money.journeys).to include journey
  #   end
  # end
end
