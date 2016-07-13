require 'oystercard'

describe 'user stories' do
  let(:card) {Oystercard.new}
  let(:station) {Station.new}

  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'so customers can use the card, have a starting balance' do
    expect { card.balance }.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'allows customer to add money to a card' do
    expect { card.top_up(10) }.not_to raise_error
  end

  it 'throws an error when maximum balance exceeded' do
    message = "Cannot top-up: exceeds maximum balance of 90"
    expect { card.top_up(91) }.to raise_error message
  end


  it 'allows customer to touch in' do
    card.top_up(5)
    expect { card.touch_in(station) }.not_to raise_error
  end

  it 'allows customer to touch out' do
    card.top_up(1)
    card.touch_in(station)
    expect { card.touch_out(station) }.not_to raise_error
  end

  it 'can tell customer if in journey' do
    card.top_up(1)
    card.touch_in(station)
    expect(card).to be_in_journey
  end

  it 'user must have minimum amount on card' do
    message = "Cannot touch in: balance is too low"
    expect { card.touch_in(station) }.to raise_error message
  end

  # In order to know how far I have travelled
  # As a customer
  # I want to know what zone a station is in

  it 'stations let customers know which zone they are in' do
      expect{ station.zone }.not_to raise_error
  end



end
